// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../localedata.dart';
import '../identifier_position.dart';

class LocaleAr implements ILocaleData {
  final String _localeString;
  String get localeString => _localeString;

  LocaleAr([this._localeString = "ar"]);

  String get seconds => 'ثواني';

  String get aMinute => 'دقيقة واحدة';
  String get minutes => '%i دقائق';

  String get anHour => 'ساعة واحدة';
  String get hours => '%i ساعات';

  String get aDay => 'يوم واحد';
  String get days => '%i أيام';

  String get aMonth => 'شهر واحد';
  String get months => '%i أشهر';

  String get aYear => 'سنة واحدة';
  String get years => '%i سنوات';

  String get futureIdentifier => 'بعد';
  String get pastIdentifier => 'منذ';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.prepend;
}