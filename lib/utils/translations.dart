
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  // late Map<String, String> _localizedStrings;
  // late Map<String, String> _localizedStringsProjet;
  // late Map<String, String> _localizedStringsPiste;
  late Map<String, String> _localizedStringsLabel;


  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonStringLabel = await rootBundle.loadString('json/label/label_${locale.languageCode}.json');
    // String jsonString = await rootBundle.loadString('json/profile/profile_${locale.languageCode}.json');
    // String jsonStringProjet = await rootBundle.loadString('json/projets/resident_uk/langue_${locale.languageCode}.json');
    // String jsonStringPiste = await rootBundle.loadString('json/label/label_${locale.languageCode}.json');
    // String jsonStringLabel = await rootBundle.loadString('json/label/label_${locale.languageCode}.json');
    // String jsonStringLabel = await rootBundle.loadString('json/label/label_${locale.languageCode}.json');


    Map<String, dynamic> jsonMapLabel = json.decode(jsonStringLabel);
    // Map<String, dynamic> jsonMap = json.decode(jsonString);
    // Map<String, dynamic> jsonMapProjet = json.decode(jsonStringProjet);
    // Map<String, dynamic> jsonMapPiste = json.decode(jsonStringPiste);

    _localizedStringsLabel = jsonMapLabel.map((key, value) {
      return MapEntry(key, value.toString());
    });

    // _localizedStrings = jsonMap.map((key, value) {
    //   return MapEntry(key, value.toString());
    // });


    // _localizedStringsProjet = jsonMapProjet.map((key, value) {
    //   return MapEntry(key, value.toString());
    // });

    // _localizedStringsPiste = jsonMapPiste.map((key, value) {
    //   return MapEntry(key, value.toString());
    // });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String? translate(String key, int i) {
    // if (i == 1) {
    //   return _localizedStrings[key];
    // } else if (i == 0) {
      return _localizedStringsLabel[key];
    // } else if (i == 2) {
    //   return _localizedStringsProjet[key];
    // } else if (i == 3) {
    //   return _localizedStringsProjet[key];
    // }
    // return "no found";
  }
}


class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}