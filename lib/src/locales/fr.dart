// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../localedata.dart';
import '../identifier_position.dart';

class LocaleFr implements ILocaleData {
  final String _localeString;
  String get localeString => _localeString;

  LocaleFr([this._localeString = "fr"]);

  String get seconds => 'quelques secondes';

  String get aMinute => 'une minute';
  String get minutes => '%i minutes';

  String get anHour => 'une heure';
  String get hours => '%i heures';

  String get aDay => 'un jour';
  String get days => '%i jours';

  String get aMonth => 'un mois';
  String get months => '%i mois';

  String get aYear => 'un an';
  String get years => '%i ans';

  String get futureIdentifier => 'dans';
  String get pastIdentifier => 'il y a';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.prepend;
}
