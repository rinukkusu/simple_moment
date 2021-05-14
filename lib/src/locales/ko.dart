// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../localedata.dart';
import '../identifier_position.dart';

class LocaleKo implements ILocaleData {
  final String _localeString;
  String get localeString => _localeString;

  LocaleKo([this._localeString = "ko"]);

  String get seconds => '몇 초';

  String get aMinute => '1분';
  String get minutes => '%i분';

  String get anHour => '한 시간';
  String get hours => '%i시간';

  String get aDay => '하루';
  String get days => '%i일';

  String get aMonth => '한 달';
  String get months => '%i달';

  String get aYear => '일 년';
  String get years => '%i년';

  String get futureIdentifier => '후';
  String get pastIdentifier => '전';

  IdentifierPosition get futurePosition => IdentifierPosition.append;
  IdentifierPosition get pastPosition => IdentifierPosition.append;
}