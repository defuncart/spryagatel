import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spryagatel/configs/db_config.dart';
import 'package:spryagatel/generated/l10n.dart';
import 'package:spryagatel/models/verb.dart';
import 'package:spryagatel/widgets/home_screen/home_screen.dart';
import 'package:spryagatel/widgets/import_screen/import_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<bool> _isInitializedFuture;

  @override
  void initState() {
    super.initState();

    _isInitializedFuture = _init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      home: FutureBuilder<bool>(
        future: _isInitializedFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data! ? const HomeScreen() : const ImportScreen();
          }

          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Future<bool> _init() async {
    final path = '${(await getApplicationDocumentsDirectory()).path}/${DBConfig.dbName}';
    print(path);
    final dir = Directory(path);

    final dbExists = await dir.exists();
    if (dbExists) {
      await Isar.open(
        schemas: [VerbSchema],
        name: DBConfig.dbName,
        directory: (await getApplicationDocumentsDirectory()).path,
      );
    }

    return dbExists;
  }
}
