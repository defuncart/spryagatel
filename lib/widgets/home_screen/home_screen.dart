import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spryagatel/configs/db_config.dart';
import 'package:spryagatel/generated/l10n.dart';
import 'package:spryagatel/models/verb.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      final isar = await Isar.open(
        schemas: [VerbSchema],
        name: DBConfig.dbName,
        directory: (await getApplicationDocumentsDirectory()).path,
      );

      final verbs = await isar.verbs.where().findAll();
      print(verbs.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Спрягатель'),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context).helloWorld),
      ),
    );
  }
}
