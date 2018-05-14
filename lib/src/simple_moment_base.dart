// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

class Moment {
  DateTime _date;

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

  String toString() {
    return _date.toString();
  }

  String fromNow([bool withoutPrefixOrSuffix = false]) {
    return from(new DateTime.now(), withoutPrefixOrSuffix);
  }

  String from(DateTime date, [bool withoutPrefixOrSuffix = false]) {
    Duration diff = date.difference(_date);

    String timeString = "";

    if (diff.inSeconds.abs() < 45) timeString = "a few seconds";
    else if (diff.inMinutes.abs() < 2) timeString = "a minute";
    else if (diff.inMinutes.abs() < 45) timeString = "${diff.inMinutes.abs()} minutes";
    else if (diff.inHours.abs() < 2) timeString = "an hour";
    else if (diff.inHours.abs() < 22) timeString = "${diff.inHours.abs()} hours";
    else if (diff.inDays.abs() < 2) timeString = "a day";
    else if (diff.inDays.abs() < 26) timeString = "${diff.inDays.abs()} days";
    else if (diff.inDays.abs() < 60) timeString = "a month";
    else if (diff.inDays.abs() < 320) timeString = "${diff.inDays.abs() ~/ 30} months";
    else if (diff.inDays.abs() < 547) timeString = "a year";
    else timeString = "${diff.inDays.abs() ~/ 356} years";

    if (!withoutPrefixOrSuffix) {
      if (diff.isNegative)
        timeString += " ago";
      else
        timeString = "in " + timeString;
    }

    return timeString;
  }
}
