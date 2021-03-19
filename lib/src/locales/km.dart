// Copyright (c) 2016, rinukkusu.
// Copyright (c) 2021, sombochea.
// All rights reserved. Use of this source code.
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../localedata.dart';
import '../identifier_position.dart';

class LocaleKm implements ILocaleData {
  final String _localeString;
  String get localeString => _localeString;

  LocaleKm([this._localeString = "km"]);

  String get seconds => 'ពីរ​ឬ​បីវិនាទី';

  String get aMinute => 'មួយ​នាទី';
  String get minutes => '%i នាទី';

  String get anHour => 'មួយ​ម៉ោង';
  String get hours => '%i ម៉ោង';

  String get aDay => 'មួយថ្ងៃ';
  String get days => '%i ថ្ងៃ';

  String get aMonth => 'មួយ​ខែ';
  String get months => '%i ខែ';

  String get aYear => 'មួយ​ឆ្នាំ';
  String get years => '%i ឆ្នាំ';

  String get futureIdentifier => 'ក្នុង';
  String get pastIdentifier => 'មុន';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.append;
}
