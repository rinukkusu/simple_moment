import '../localedata.dart';
import '../identifier_position.dart';

class LocaleEn implements ILocaleData {
  String get seconds => 'a few seconds';

  String get aMinute => 'a minute';
  String get minutes => '%i minutes';

  String get anHour => 'an hour';
  String get hours => '%i hours';

  String get aDay => 'a day';
  String get days => '%i days';

  String get aMonth => 'a month';
  String get months => '%i months';

  String get aYear => 'a year';
  String get years => '%i years';

  String get futureIdentifier => 'in';
  String get pastIdentifier => 'ago';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.append;
}