// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../localedata.dart';
import '../identifier_position.dart';

class LocaleTr implements ILocaleData {
  final String _localeString;
  String get localeString => _localeString;

  LocaleTr([this._localeString = "tr"]);

  String get seconds => 'bir kaç saniye';

  String get aMinute => 'bir dakika';
  String get minutes => '%i dakika';

  String get anHour => 'bir saat';
  String get hours => '%i saat';

  String get aDay => 'bir gün';
  String get days => '%i gün';

  String get aMonth => 'bir ay';
  String get months => '%i ay';

  String get aYear => 'bir yıl';
  String get years => '%i yıl';

  String get futureIdentifier => 'sonra';
  String get pastIdentifier => 'önce';

  IdentifierPosition get futurePosition => IdentifierPosition.append;
  IdentifierPosition get pastPosition => IdentifierPosition.append;
}
