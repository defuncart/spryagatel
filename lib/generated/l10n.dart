// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `{count, plural, zero{There are no verbs} one{There is 1 verb} other{There are {count} verbs}}`
  String homeScreenInfoText(num count) {
    return Intl.plural(
      count,
      zero: 'There are no verbs',
      one: 'There is 1 verb',
      other: 'There are $count verbs',
      name: 'homeScreenInfoText',
      desc: 'Info text',
      args: [count],
    );
  }

  /// `Import`
  String get importScreenButtonText {
    return Intl.message(
      'Import',
      name: 'importScreenButtonText',
      desc: 'Import button text on import screen',
      args: [],
    );
  }

  /// `Before first use, the database needs to be imported. Do you want to continue?`
  String get importScreenHeadlineText {
    return Intl.message(
      'Before first use, the database needs to be imported. Do you want to continue?',
      name: 'importScreenHeadlineText',
      desc: 'Headline text on import screen',
      args: [],
    );
  }

  /// `This will roughly take 2 minutes.`
  String get importScreenSubheadlineText {
    return Intl.message(
      'This will roughly take 2 minutes.',
      name: 'importScreenSubheadlineText',
      desc: 'Sub-headline text on import screen',
      args: [],
    );
  }

  /// `No results found`
  String get searchNoResultsFound {
    return Intl.message(
      'No results found',
      name: 'searchNoResultsFound',
      desc: 'Text when no results are found',
      args: [],
    );
  }

  /// `Search term is empty`
  String get searchTermEmpty {
    return Intl.message(
      'Search term is empty',
      name: 'searchTermEmpty',
      desc: 'Text when search term is empty',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
