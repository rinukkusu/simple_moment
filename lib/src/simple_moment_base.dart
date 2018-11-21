// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'localedata.dart';
import 'locales/en.dart';
import 'identifier_position.dart';

class Moment {
  DateTime _date;
  static ILocaleData _globalLocale = new LocaleEn();
  ILocaleData _locale;

  Moment.now() {
    _date = new DateTime.now();
  }

  Moment.fromDate(DateTime date) {
    _date = date;
  }

  Moment.fromMillisecondsSinceEpoch(int millisecondsSinceEpoch,
      {bool isUtc: false}) {
    _date = new DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch,
        isUtc: isUtc);
  }

  static Moment parse(String date) {
    return new Moment.fromDate(DateTime.parse(date));
  }

  static setLocaleGlobally(ILocaleData locale) {
    _globalLocale = locale;
  }

  Moment locale(ILocaleData locale) {
    _locale = locale;
    return this;
  }

  ILocaleData _getLocale() {
    return _locale ?? _globalLocale;
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

    var locale = _getLocale();

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
      case IdentifierPosition.append:
        return '${timeString} ${identifier}';

      case IdentifierPosition.dontDisplay:
      default:
        return timeString;
    }
  }
}
