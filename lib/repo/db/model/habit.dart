import 'package:moor/moor.dart';

class Habits extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 2, max: 32)();
  IntColumn get goalPerDay => integer()();
  IntColumn get color => integer()();
}
