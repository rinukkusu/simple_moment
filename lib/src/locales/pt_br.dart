// Copyright (c) 2018, lennonjesus. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../identifier_position.dart';
import '../localedata.dart';

class LocalePtBr implements ILocaleData {
  final String _localeString;
  String get localeString => _localeString;

  LocalePtBr([this._localeString = "pt_br"]);

  String get seconds => 'alguns segundos';

  String get aMinute => 'um minuto';
  String get minutes => '%i minutos';

  String get anHour => 'uma hora';
  String get hours => '%i horas';

  String get aDay => 'um dia';
  String get days => '%i dias';

  String get aMonth => 'um mês';
  String get months => '%i meses';

  String get aYear => 'um ano';
  String get years => '%i anos';

  String get futureIdentifier => 'em';
  String get pastIdentifier => 'atrás';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.append;
}
