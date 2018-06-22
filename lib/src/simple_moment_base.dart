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

    if (diff.inSeconds.abs() < 45) timeString = locale.seconds;
    else if (diff.inMinutes.abs() < 2) timeString = locale.aMinute;
    else if (diff.inMinutes.abs() < 45) timeString = "${diff.inMinutes.abs()} ${locale.minutes}";
    else if (diff.inHours.abs() < 2) timeString = locale.anHour;
    else if (diff.inHours.abs() < 22) timeString = "${diff.inHours.abs()} ${locale.hours}";
    else if (diff.inDays.abs() < 2) timeString = locale.aDay;
    else if (diff.inDays.abs() < 26) timeString = "${diff.inDays.abs()} ${locale.days}";
    else if (diff.inDays.abs() < 60) timeString = locale.aMonth;
    else if (diff.inDays.abs() < 320) timeString = "${diff.inDays.abs() ~/ 30} ${locale.months}";
    else if (diff.inDays.abs() < 547) timeString = locale.aYear;
    else timeString = "${diff.inDays.abs() ~/ 356} ${locale.years}";

    if (!withoutPrefixOrSuffix) {
      if (diff.isNegative)
        timeString = _addIdentifier(timeString, locale.pastPosition, locale.pastIdentifier);
      else
        timeString = _addIdentifier(timeString, locale.futurePosition, locale.futureIdentifier);
    }

    return timeString;
  }

  String _addIdentifier(String timeString, IdentifierPosition position, String identifier) {
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
