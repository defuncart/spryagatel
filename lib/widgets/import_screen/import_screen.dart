import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spryagatel/services/database_importer.dart';

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
        body: Builder(
          builder: (context) => Center(
            child: ElevatedButton(
              onPressed: () async {
                _ModalProgressIndicator.show(context);
                await _initIsolate();
              },
              child: const Text('Import'),
            ),
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
          print('[isolateToMainStream] $data');
        }
      },
      onDone: () => print('done!'),
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
    final docPath = (await getApplicationDocumentsDirectory()).path;
    final downloadsPath = (await getExternalStorageDirectory())!.path;

    await DatabaseImporter.generate(
      rows: rows,
      docPath: docPath,
      downloadsPath: downloadsPath,
    );

    _ModalProgressIndicator.dismiss();
  }

  static void _myIsolate(List<Object> arguments) async {
    final mainToIsolateStream = ReceivePort();
    final isolateToMainStream = arguments[0] as SendPort;
    isolateToMainStream.send(mainToIsolateStream.sendPort);

    final csvString = arguments[1] as String;
    mainToIsolateStream.listen((data) {
      print('[mainToIsolateStream] $data');
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