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

    if (diff.inSeconds < 45) timeString = "a few seconds";
    else if (diff.inSeconds < 90) timeString = "a minute";
    else if (diff.inMinutes < 45) timeString = "${diff.inMinutes} minutes";
    else if (diff.inMinutes < 90) timeString = "an hour";
    else if (diff.inHours < 22) timeString = "${diff.inHours} hours";
    else if (diff.inHours < 36) timeString = "a day";
    else if (diff.inDays < 26) timeString = "${diff.inDays} days";
    else if (diff.inDays < 46) timeString = "a month";
    else if (diff.inDays < 320) timeString = "${diff.inDays ~/ 30} months";
    else if (diff.inDays < 547) timeString = "a year";
    else timeString = "${diff.inDays ~/ 356} years";

    if (!withoutPrefixOrSuffix) {
      if (diff.inSeconds < 0)
        timeString += " ago";
      else
        timeString = "in " + timeString;
    }

    return timeString;
  }
}
