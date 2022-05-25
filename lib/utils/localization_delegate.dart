import 'dart:async';
import 'package:flutter/material.dart';
import 'localization.dart';

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const LocalizationDelegate();

  /// Describe the supported languages within our app
  @override
  bool isSupported(Locale locale) => ['fr', 'en'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) => Localization.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}
