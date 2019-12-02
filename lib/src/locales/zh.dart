// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../localedata.dart';
import '../identifier_position.dart';

class LocaleZh implements ILocaleData {
  String get seconds => '几秒钟';

  String get aMinute => '一分钟';
  String get minutes => '%i 分钟';

  String get anHour => '一小时';
  String get hours => '%i 小时';

  String get aDay => '一天';
  String get days => '%i 天';

  String get aMonth => '一个月';
  String get months => '%i 个月';

  String get aYear => '一年';
  String get years => '%i 年';

  String get futureIdentifier => '内';
  String get pastIdentifier => '前';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.prepend;
}
