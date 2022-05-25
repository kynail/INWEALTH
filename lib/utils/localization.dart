import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Localization {
  /// Initialize localization systems and messages
  static Future<Localization> load(Locale locale) async {
    // If we're given "en_US", we'll use it as-is. If we're
    // given "en", we extract it and use it.
    // final String localeName =
    //     locale.countryCode == null || locale.countryCode.isEmpty
    //         ? locale.languageCode
    //         : locale.toString();

    // We make sure the locale name is in the right format e.g.
    // converting "en-US" to "en_US".
    // final String canonicalLocaleName = Intl.canonicalizedLocale(localeName);

    // Load localized messages for the current locale.
    // await initializeMessages(canonicalLocaleName);
    // We'll uncomment the above line after we've built our messages file

    // Right now we want to force the locale to "fr" instead of retrieving the locale from user's machine
    Intl.defaultLocale = "fr";

    return Localization();
  }

  /// Retrieve the compact currency format we want to use within the app
  NumberFormat get compactCurrencyFormat =>
      NumberFormat.compactCurrency(locale: Intl.defaultLocale, symbol: "€");

  /// Retrieve the compact currency format we want to use within the app
  NumberFormat get currencyFormat =>
      NumberFormat.currency(locale: Intl.defaultLocale, symbol: "€");

  /// Retrieve localization resources for the widget tree
  /// corresponding to the given `context`
  static Localization of(BuildContext context) =>
      Localizations.of<Localization>(context, Localization)!;
}
