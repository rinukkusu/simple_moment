import '../localedata.dart';
import '../identifier_position.dart';


class LocaleZhCN extends ILocaleData {
  final String _localeString;

  @override
  String get localeString => _localeString;

  LocaleZhCN([this._localeString = "zh-CN"]);

  @override
  String get seconds => '几秒钟';

  @override
  String get aMinute => '一分钟';

  @override
  String get minutes => '%i分钟';

  @override
  String get anHour => '一小时';

  @override
  String get hours => '%i小时';

  @override
  String get aDay => '一天';

  @override
  String get days => '%i天';

  @override
  String get aMonth => '一个月';

  @override
  String get months => '%i月';

  @override
  String get aYear => '一年';

  @override
  String get years => '%i年';

  @override
  String get futureIdentifier => '之后';

  @override
  String get pastIdentifier => '之前';

  @override
  IdentifierPosition get futurePosition => IdentifierPosition.prepend;

  @override
  IdentifierPosition get pastPosition => IdentifierPosition.append;
}