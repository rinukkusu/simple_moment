import '../localedata.dart';
import '../identifier_position.dart';

class LocaleDe implements ILocaleData {
  String get seconds => 'einigen Sekunden';

  String get aMinute => 'einer Minute';
  String get minutes => '%i Minuten';

  String get anHour => 'einer Stunde';
  String get hours => '%i Stunden';

  String get aDay => 'einem Tag';
  String get days => '%i Tagen';

  String get aMonth => 'einem Monat';
  String get months => '%i Monaten';

  String get aYear => 'einem Jahr';
  String get years => '%i Jahren';

  String get futureIdentifier => 'in';
  String get pastIdentifier => 'vor';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.prepend;
}