// Copyright (c) 2019, nutchaitat. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../identifier_position.dart';
import '../localedata.dart';

class LocaleTh extends ILocaleData {
  String get seconds => 'ไม่กี่วินาที';

  String get aMinute => 'นาที';
  String get minutes => '%i นาที';

  String get anHour => 'ชั่วโมง';
  String get hours => '%i ชั่วโมง';

  String get aDay => '1 วัน';
  String get days => '%i วัน';

  String get aMonth => '1 เดือน';
  String get months => '%i เดือน';

  String get aYear => '1 ปี';
  String get years => '%i ปี';

  String get futureIdentifier => 'อีก';
  String get pastIdentifier => 'ที่แล้ว';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.appendWithoutSpace;
}
