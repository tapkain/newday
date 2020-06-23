import 'package:moor/moor.dart';

class Reminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get habitId => integer()();
  DateTimeColumn get date => dateTime()();
}
