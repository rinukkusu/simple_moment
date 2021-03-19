// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:intl/intl.dart';

import 'localedata.dart';
import 'locales/en.dart';
import 'identifier_position.dart';

class Moment {
  late DateTime _date;
  static ILocaleData _globalLocale = new LocaleEn();
  late ILocaleData _locale;
  static int monthPerQuarter = 3;
  static bool _useGlobalLocaleInFormat = false;
  bool _useLocaleInFormat = false;

  ILocaleData get usedLocale => _locale ?? _globalLocale;
  DateTime get date => _date;

  Moment.now() {
    _date = new DateTime.now();
  }

  /// Create a moment instance from Date
  ///
  /// @param date The date
  Moment.fromDate(DateTime date) {
    _date = date;
  }

  /// Create a date from milliseconds
  ///
  /// @param millisecondsSinceEpoch
  Moment.fromMillisecondsSinceEpoch(int millisecondsSinceEpoch,
      {bool isUtc: false}) {
    _date = new DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch,
        isUtc: isUtc);
  }

  /// Converts a Date String to an actual DateTime object
  ///
  /// @param date The date String
  /// @returns a moment instance
  static Moment parse(String date) {
    return new Moment.fromDate(DateTime.parse(date));
  }

  Moment.fromDateTime(this._date);

  ///
  /// Adds time to the current date
  ///
  Moment add({
    int years: 0,
    int quarters: 0,
    int months: 0,
    int weeks: 0,
    int days: 0,
    int hours: 0,
    int minutes: 0,
    int seconds: 0,
    int milliseconds: 0,
    int microseconds: 0,
  }) {
    var dateTime = DateTime(
      _date.year + years,
      _date.month + months + quarters * monthPerQuarter,
      _date.day + days + weeks * DateTime.daysPerWeek,
      _date.hour + hours,
      _date.minute + minutes,
      _date.second + seconds,
      _date.millisecond + milliseconds,
      _date.microsecond + microseconds,
    );
    return Moment.fromDateTime(dateTime);
  }

  ///
  /// Substracts time to the current date
  ///
  Moment subtract({
    int years: 0,
    int quarters: 0,
    int months: 0,
    int weeks: 0,
    int days: 0,
    int hours: 0,
    int minutes: 0,
    int seconds: 0,
    int milliseconds: 0,
    int microseconds: 0,
  }) {
    var dateTime = DateTime(
      _date.year - years,
      _date.month - months - quarters * monthPerQuarter,
      _date.day - days - weeks * DateTime.daysPerWeek,
      _date.hour - hours,
      _date.minute - minutes,
      _date.second - seconds,
      _date.millisecond - milliseconds,
      _date.microsecond - microseconds,
    );
    return Moment.fromDateTime(dateTime);
  }

  /// Formats the date to the given format
  ///
  /// @param pattern The pattern
  /// @returns The formatted date
  /// ```
  /// String formattedDate = Moment.format("yyyy-mm-dd HH:mm");
  /// ```
  ///
  String format(String pattern, {String? localeOverride}) {
    if (_useGlobalLocaleInFormat ||
        _useLocaleInFormat ||
        localeOverride != null)
      return DateFormat(pattern, localeOverride ?? usedLocale.localeString)
          .format(_date);

    return DateFormat(pattern).format(_date);
  }

  int get year => _date.year;

  /// The quarter
  int get quarter => (_date.month - 1) ~/ 3 + 1;

  /// The month
  int get month => _date.month;

  /// The day of the month
  int get day => _date.day;

  /// The day of the week
  int get weekday => _date.weekday;

  /// Compares the given date to the current one
  ///
  /// @param date The date to compare with the current one
  /// @returns an int
  int compareTo(DateTime date) {
    return _date.compareTo(date);
  }

  /// Sets the global locale
  ///
  /// If [useInFormat] is set to true, the chosen locale needs to be
  /// initialized with [initializeDateFormatting(locale.localeString)]
  static setLocaleGlobally(ILocaleData locale, {useInFormat = false}) {
    _globalLocale = locale;
    _useGlobalLocaleInFormat = useInFormat;
  }

  /// Sets the locale for this instance
  ///
  /// If [useInFormat] is set to true, the chosen locale needs to be
  /// initialized with [initializeDateFormatting(locale.localeString)]
  Moment locale(ILocaleData locale, {useInFormat = false}) {
    _locale = locale;
    _useLocaleInFormat = useInFormat;
    return this;
  }

  String toString() {
    return _date.toString();
  }

  String fromNow([bool withoutPrefixOrSuffix = false]) {
    return from(new DateTime.now(), withoutPrefixOrSuffix);
  }

  String from(DateTime date, [bool withoutPrefixOrSuffix = false]) {
    Duration diff = date.difference(_date);

    String timeString = "";

    final locale = usedLocale;

    if (diff.inSeconds.abs() < 45)
      timeString = locale.seconds.replaceFirst('%i', '${diff.inSeconds.abs()}');
    else if (diff.inMinutes.abs() < 2)
      timeString = locale.aMinute.replaceFirst('%i', '${diff.inMinutes.abs()}');
    else if (diff.inMinutes.abs() < 45)
      timeString = locale.minutes.replaceFirst('%i', '${diff.inMinutes.abs()}');
    else if (diff.inHours.abs() < 2)
      timeString = locale.anHour.replaceFirst('%i', '${diff.inHours.abs()}');
    else if (diff.inHours.abs() < 22)
      timeString = locale.hours.replaceFirst('%i', '${diff.inHours.abs()}');
    else if (diff.inDays.abs() < 2)
      timeString = locale.aDay.replaceFirst('%i', '${diff.inDays.abs()}');
    else if (diff.inDays.abs() < 26)
      timeString = locale.days.replaceFirst('%i', '${diff.inDays.abs()}');
    else if (diff.inDays.abs() < 60)
      timeString =
          locale.aMonth.replaceFirst('%i', '${diff.inDays.abs() ~/ 30}');
    else if (diff.inDays.abs() < 320)
      timeString =
          locale.months.replaceFirst('%i', '${diff.inDays.abs() ~/ 30}');
    else if (diff.inDays.abs() < 547)
      timeString =
          locale.aYear.replaceFirst('%i', '${diff.inDays.abs() ~/ 356}');
    else
      timeString =
          locale.years.replaceFirst('%i', '${diff.inDays.abs() ~/ 356}');

    if (!withoutPrefixOrSuffix) {
      if (diff.isNegative)
        timeString = _addIdentifier(
            timeString, locale.pastPosition, locale.pastIdentifier);
      else
        timeString = _addIdentifier(
            timeString, locale.futurePosition, locale.futureIdentifier);
    }

    return timeString;
  }

  String _addIdentifier(
      String timeString, IdentifierPosition position, String identifier) {
    switch (position) {
      case IdentifierPosition.prepend:
        return '${identifier} ${timeString}';
      case IdentifierPosition.prependWithoutSpace:
        return '${identifier}${timeString}';
      case IdentifierPosition.append:
        return '${timeString} ${identifier}';
      case IdentifierPosition.appendWithoutSpace:
        return '${timeString}${identifier}';

      case IdentifierPosition.dontDisplay:
      default:
        return timeString;
    }
  }
}
