import '../localedata.dart';
import '../identifier_position.dart';

class LocaleDe implements ILocaleData {
  String get seconds => 'einigen Sekunden';

  String get aMinute => 'einer Minute';
  String get minutes => 'Minuten';

  String get anHour => 'einer Stunde';
  String get hours => 'Stunden';

  String get aDay => 'einem Tag';
  String get days => 'Tagen';

  String get aWeek => 'einer Woche';
  String get weeks => 'Wochen';

  String get aMonth => 'einem Monat';
  String get months => 'Monaten';

  String get aYear => 'einem Jahr';
  String get years => 'Jahren';

  String get futureIdentifier => 'in';
  String get pastIdentifier => 'vor';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.prepend;
}