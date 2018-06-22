import '../localedata.dart';
import '../identifier_position.dart';

class LocaleEn implements ILocaleData {
  String get seconds => 'a few seconds';

  String get aMinute => 'a minute';
  String get minutes => 'minutes';

  String get anHour => 'an hour';
  String get hours => 'hours';

  String get aDay => 'a day';
  String get days => 'days';

  String get aWeek => 'a week';
  String get weeks => 'weeks';

  String get aMonth => 'a month';
  String get months => 'months';

  String get aYear => 'a year';
  String get years => 'years';

  String get futureIdentifier => 'in';
  String get pastIdentifier => 'ago';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.append;
}