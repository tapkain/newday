import 'package:newday/repo/db/db.dart';

export 'entry.dart';
export 'habit.dart';
export 'reminder.dart';

class FullHabit {
  final Habit habit;
  final List<Entrie> entries;

  FullHabit({this.habit, this.entries});
}
