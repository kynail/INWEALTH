import 'package:date_format/date_format.dart';

class FrenchDateLocales implements DateLocale {
  const FrenchDateLocales();

  final List<String> monthsShort = const [
    'Jan',
    'Fév',
    'Mars',
    'Avr',
    'Mai',
    'Juin',
    'Juil',
    'Août',
    'Sept',
    'Oct',
    'Nov',
    'Déc'
  ];

  final List<String> monthsLong = const [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final List<String> daysShort = const [
    'Lun',
    'Mar',
    'Mer',
    'Jeu',
    'Ven',
    'Sam',
    'Dim'
  ];

  final List<String> daysLong = const [
    'Monday',
    'Tuesday',
    'Weednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  String get am => "AM";

  @override
  String get pm => "PM";
}
