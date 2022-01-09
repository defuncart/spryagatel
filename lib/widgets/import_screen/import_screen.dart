import 'dart:async';
import 'dart:developer' show log;
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spryagatel/generated/l10n.dart';
import 'package:spryagatel/services/database_importer.dart';
import 'package:spryagatel/widgets/home_screen/home_screen.dart';

class ImportScreen extends StatefulWidget {
  const ImportScreen({Key? key}) : super(key: key);

  @override
  _ImportScreenState createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).importScreenHeadlineText,
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context).importScreenSubheadlineText,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    _ModalProgressIndicator.show(context);
                    await _initIsolate();
                  },
                  child: Text(
                    AppLocalizations.of(context).importScreenButtonText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<SendPort> _initIsolate() async {
    late Isolate isolate;
    final completer = Completer<SendPort>();
    final isolateToMainStream = ReceivePort();

    isolateToMainStream.listen(
      (data) {
        if (data is SendPort) {
          completer.complete(data);
        } else if (data is List<List<String>>) {
          _createDatabase(data);
          isolate.kill();
        } else {
          log('[isolateToMainStream] $data');
        }
      },
      onDone: () => log('done!'),
    );

    // load db contents from rootBundle as platform methods do not work in isolates
    final csvString = await rootBundle.loadString(DatabaseImporter.csvDBPath);

    isolate = await Isolate.spawn(_myIsolate, [
      isolateToMainStream.sendPort,
      csvString,
    ]);

    return completer.future;
  }

  Future<void> _createDatabase(List<List<String>> rows) async {
    await DatabaseImporter.generate(
      rows: rows,
    );

    _ModalProgressIndicator.dismiss();
    Future.microtask(
      () => Navigator.of(context).pushReplacementNamed(HomeScreen.routeName),
    );
  }

  static void _myIsolate(List<Object> arguments) async {
    final mainToIsolateStream = ReceivePort();
    final isolateToMainStream = arguments[0] as SendPort;
    isolateToMainStream.send(mainToIsolateStream.sendPort);

    final csvString = arguments[1] as String;
    mainToIsolateStream.listen((data) {
      log('[mainToIsolateStream] $data');
    });

    final rows = await DatabaseImporter.parse(
      csvString: csvString,
    );

    isolateToMainStream.send(rows);
  }
}

class _ModalProgressIndicator {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
    final overlayState = Overlay.of(context);
    if (overlayState != null) {
      _overlayEntry = OverlayEntry(
        builder: (context) => Container(
          color: Colors.black.withAlpha(128),
          width: double.infinity,
          height: double.infinity,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
      overlayState.insert(_overlayEntry!);
    }
  }

  static void dismiss() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
