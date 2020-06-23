import 'package:moor/moor.dart';

class Entries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get habitId => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get note => text().nullable()();
}
