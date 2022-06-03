import 'package:date_format/date_format.dart';
import 'package:date_format/date_format.dart';

import 'french_date_locale.dart';


abstract class DateService {
  static DateLocale locale = FrenchDateLocales();

  static String toFormatDate(
    DateTime dateTime,
    List<String> formats,
  ) =>
      formatDate(
        dateTime,
        formats,
        locale: locale,
      );

  static String toMonthYear(
    DateTime dateTime,
  ) =>
      toFormatDate(
        dateTime,
        [MM, ' ', yyyy],
      );

  static String toHourMinutes(
    DateTime dateTime,
  ) =>
      toFormatDate(
        dateTime,
        [HH, ':', nn],
      );

  static String toCompleteDayMonth(
    DateTime dateTime,
  ) =>
      toFormatDate(
        dateTime,
        [DD, ' ', dd, ' ', MM],
      );

  static String toDayMonth(
    DateTime dateTime,
  ) =>
      toFormatDate(
        dateTime,
        [dd, '/', mm],
      );

  static String toCompleteDayHourMinutes(
    DateTime dateTime,
  ) =>
      toFormatDate(
        dateTime,
        [DD, ' ', dd, ' ', MM, ' - ', HH, '\\:', nn],
      );

  static String toDayMonthYearHourMinutes(
    DateTime dateTime,
  ) =>
      toFormatDate(
        dateTime,
        [dd, '/', mm, '/', yyyy, ' ', HH, '\\:', nn],
      );
}
