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
  var _isLoaded = false;
  late int _numberVerbs;
  late Isar _isar;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _isar = await Isar.open(
        schemas: [VerbSchema],
        name: DBConfig.dbName,
        directory: (await getApplicationDocumentsDirectory()).path,
      );

      final verbs = await _isar.verbs.where().findAll();
      setState(() {
        _numberVerbs = verbs.length;
        _isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Спрягатель'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: _SearchDelegate(_isar),
            ),
          ),
        ],
      ),
      body: _isLoaded
          ? Center(
              child: Text(AppLocalizations.of(context).homeScreenInfoText(_numberVerbs)),
            )
          : const SizedBox.shrink(),
    );
  }
}

class _SearchDelegate extends SearchDelegate {
  _SearchDelegate(Isar isar) : _isar = isar;

  final Isar _isar;

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text(AppLocalizations.current.searchTermEmpty),
      );
    }

    return _showResults;
  }

  @override
  Widget buildSuggestions(BuildContext context) => _showResults;

  Widget get _showResults => FutureBuilder(
      future: _isar.verbs.where().filter().infinitivContains(query).build().findAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final raw = snapshot.data as List<Verb>;
          final results = raw.take(10).toList();

          if (results.isEmpty) {
            return Center(
              child: Text(AppLocalizations.current.searchNoResultsFound),
            );
          }

          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, count) => ListTile(
              title: Text(results[count].infinitiv),
            ),
          );
        }

        return const SizedBox.shrink();
      });
}
