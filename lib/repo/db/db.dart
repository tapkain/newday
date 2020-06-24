import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'model/model.dart';

part 'db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File(await NewDayDB.dbPath());
//    await file.delete();
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [Habits, Entries, Reminders])
class NewDayDB extends _$NewDayDB {
  static Future<String> dbPath() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return p.join(dbFolder.path, 'db.sqlite');
  }

  NewDayDB() : super(_openConnection());

  Future<List<FullHabit>> allHabits() async {
    final all = await select(habits).get();
    return _joinEntries(all);
  }

  Future<bool> hasHabits() async {
    final all = await select(habits).get();
    return all.isNotEmpty;
  }

  Stream<List<FullHabit>> watchHabits() {
    return select(habits).watch().asyncMap(_joinEntries);
  }

  Future<List<FullHabit>> _joinEntries(List<Habit> rows) async {
    final futures = rows.map((e) => entriesFor(e));
    final result = await Future.wait(futures);

    List<FullHabit> fullHabits = [];

    final i = rows.iterator;
    final j = result.iterator;
    while (i.moveNext() && j.moveNext()) {
      fullHabits.add(FullHabit(habit: i.current, entries: j.current));
    }

    return fullHabits;
  }

  Future<List<Entrie>> entriesFor(Habit h) {
    final now = DateTime.now();
    return (select(entries)
          ..where((tbl) =>
              tbl.habitId.equals(h.id) &
              tbl.date.year.equals(now.year) &
              tbl.date.month.equals(now.month) &
              tbl.date.day.equals(now.day)))
        .get();
  }

  Future<List<Reminder>> remindersFor(Habit h) {
    return (select(reminders)..where((tbl) => tbl.habitId.equals(h.id))).get();
  }

  Future<int> upsertEntry(Entrie e) {
    return into(entries).insertOnConflictUpdate(e);
  }

  Future<int> upsertHabit(Habit h) {
    return into(habits).insertOnConflictUpdate(h);
  }

  Future<int> upsertReminder(Reminder r) {
    return into(reminders).insertOnConflictUpdate(r);
  }

  Future<int> deleteEntry(Entrie e) {
    return (delete(entries)..where((tbl) => tbl.id.equals(e.id))).go();
  }

  Future<int> deleteHabit(Habit h) async {
    var count =
        await (delete(entries)..where((tbl) => tbl.habitId.equals(h.id))).go();
    count += await (delete(reminders)..where((tbl) => tbl.habitId.equals(h.id)))
        .go();
    count += await (delete(habits)..where((tbl) => tbl.id.equals(h.id))).go();
    return count;
  }

  @override
  int get schemaVersion => 1;
}
