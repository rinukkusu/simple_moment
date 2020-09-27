// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../localedata.dart';
import '../identifier_position.dart';

class LocaleEn implements ILocaleData {
  final String _localeString;
  String get localeString => _localeString;

  LocaleEn([this._localeString = "vi"]);

  String get seconds => 'vài giây';

  String get aMinute => 'một phút';
  String get minutes => '%i phút';

  String get anHour => 'một giờ';
  String get hours => '%i giờ';

  String get aDay => 'một ngày';
  String get days => '%i ngày';

  String get aMonth => 'một tháng';
  String get months => '%i tháng';

  String get aYear => 'một năm';
  String get years => '%i năm';

  String get futureIdentifier => 'tới';
  String get pastIdentifier => 'trước';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.append;
}
