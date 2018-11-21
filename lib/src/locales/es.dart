import '../localedata.dart';
import '../identifier_position.dart';

class LocaleEs implements ILocaleData {
  String get seconds => 'unos segundos';

  String get aMinute => 'un minuto';
  String get minutes => '%i minutos';

  String get anHour => 'una hora';
  String get hours => '%i horas';

  String get aDay => 'un día';
  String get days => '%i días';

  String get aMonth => 'un mes';
  String get months => '%i meses';

  String get aYear => 'un año';
  String get years => '%i años';

  String get futureIdentifier => 'en';
  String get pastIdentifier => 'hace';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.prepend;
}
