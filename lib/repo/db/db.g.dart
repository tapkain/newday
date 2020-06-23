// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Habit extends DataClass implements Insertable<Habit> {
  final int id;
  final String title;
  final int goalPerDay;
  final int color;
  Habit(
      {@required this.id,
      @required this.title,
      @required this.goalPerDay,
      @required this.color});
  factory Habit.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Habit(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      goalPerDay: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}goal_per_day']),
      color: intType.mapFromDatabaseResponse(data['${effectivePrefix}color']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || goalPerDay != null) {
      map['goal_per_day'] = Variable<int>(goalPerDay);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      goalPerDay: goalPerDay == null && nullToAbsent
          ? const Value.absent()
          : Value(goalPerDay),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
    );
  }

  factory Habit.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Habit(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      goalPerDay: serializer.fromJson<int>(json['goalPerDay']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'goalPerDay': serializer.toJson<int>(goalPerDay),
      'color': serializer.toJson<int>(color),
    };
  }

  Habit copyWith({int id, String title, int goalPerDay, int color}) => Habit(
        id: id ?? this.id,
        title: title ?? this.title,
        goalPerDay: goalPerDay ?? this.goalPerDay,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('Habit(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('goalPerDay: $goalPerDay, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(goalPerDay.hashCode, color.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Habit &&
          other.id == this.id &&
          other.title == this.title &&
          other.goalPerDay == this.goalPerDay &&
          other.color == this.color);
}

class HabitsCompanion extends UpdateCompanion<Habit> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> goalPerDay;
  final Value<int> color;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.goalPerDay = const Value.absent(),
    this.color = const Value.absent(),
  });
  HabitsCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required int goalPerDay,
    @required int color,
  })  : title = Value(title),
        goalPerDay = Value(goalPerDay),
        color = Value(color);
  static Insertable<Habit> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<int> goalPerDay,
    Expression<int> color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (goalPerDay != null) 'goal_per_day': goalPerDay,
      if (color != null) 'color': color,
    });
  }

  HabitsCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<int> goalPerDay,
      Value<int> color}) {
    return HabitsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      goalPerDay: goalPerDay ?? this.goalPerDay,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (goalPerDay.present) {
      map['goal_per_day'] = Variable<int>(goalPerDay.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    return map;
  }
}

class $HabitsTable extends Habits with TableInfo<$HabitsTable, Habit> {
  final GeneratedDatabase _db;
  final String _alias;
  $HabitsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 6, maxTextLength: 32);
  }

  final VerificationMeta _goalPerDayMeta = const VerificationMeta('goalPerDay');
  GeneratedIntColumn _goalPerDay;
  @override
  GeneratedIntColumn get goalPerDay => _goalPerDay ??= _constructGoalPerDay();
  GeneratedIntColumn _constructGoalPerDay() {
    return GeneratedIntColumn(
      'goal_per_day',
      $tableName,
      false,
    );
  }

  final VerificationMeta _colorMeta = const VerificationMeta('color');
  GeneratedIntColumn _color;
  @override
  GeneratedIntColumn get color => _color ??= _constructColor();
  GeneratedIntColumn _constructColor() {
    return GeneratedIntColumn(
      'color',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, goalPerDay, color];
  @override
  $HabitsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'habits';
  @override
  final String actualTableName = 'habits';
  @override
  VerificationContext validateIntegrity(Insertable<Habit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('goal_per_day')) {
      context.handle(
          _goalPerDayMeta,
          goalPerDay.isAcceptableOrUnknown(
              data['goal_per_day'], _goalPerDayMeta));
    } else if (isInserting) {
      context.missing(_goalPerDayMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color'], _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habit map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Habit.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $HabitsTable createAlias(String alias) {
    return $HabitsTable(_db, alias);
  }
}

class Entrie extends DataClass implements Insertable<Entrie> {
  final int id;
  final int habitId;
  final DateTime date;
  final String note;
  Entrie(
      {@required this.id,
      @required this.habitId,
      @required this.date,
      this.note});
  factory Entrie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    return Entrie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      habitId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}habit_id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || habitId != null) {
      map['habit_id'] = Variable<int>(habitId);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  EntriesCompanion toCompanion(bool nullToAbsent) {
    return EntriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      habitId: habitId == null && nullToAbsent
          ? const Value.absent()
          : Value(habitId),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Entrie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Entrie(
      id: serializer.fromJson<int>(json['id']),
      habitId: serializer.fromJson<int>(json['habitId']),
      date: serializer.fromJson<DateTime>(json['date']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habitId': serializer.toJson<int>(habitId),
      'date': serializer.toJson<DateTime>(date),
      'note': serializer.toJson<String>(note),
    };
  }

  Entrie copyWith({int id, int habitId, DateTime date, String note}) => Entrie(
        id: id ?? this.id,
        habitId: habitId ?? this.habitId,
        date: date ?? this.date,
        note: note ?? this.note,
      );
  @override
  String toString() {
    return (StringBuffer('Entrie(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('date: $date, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(habitId.hashCode, $mrjc(date.hashCode, note.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Entrie &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.date == this.date &&
          other.note == this.note);
}

class EntriesCompanion extends UpdateCompanion<Entrie> {
  final Value<int> id;
  final Value<int> habitId;
  final Value<DateTime> date;
  final Value<String> note;
  const EntriesCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.date = const Value.absent(),
    this.note = const Value.absent(),
  });
  EntriesCompanion.insert({
    this.id = const Value.absent(),
    @required int habitId,
    @required DateTime date,
    this.note = const Value.absent(),
  })  : habitId = Value(habitId),
        date = Value(date);
  static Insertable<Entrie> custom({
    Expression<int> id,
    Expression<int> habitId,
    Expression<DateTime> date,
    Expression<String> note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (date != null) 'date': date,
      if (note != null) 'note': note,
    });
  }

  EntriesCompanion copyWith(
      {Value<int> id,
      Value<int> habitId,
      Value<DateTime> date,
      Value<String> note}) {
    return EntriesCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      date: date ?? this.date,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<int>(habitId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }
}

class $EntriesTable extends Entries with TableInfo<$EntriesTable, Entrie> {
  final GeneratedDatabase _db;
  final String _alias;
  $EntriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _habitIdMeta = const VerificationMeta('habitId');
  GeneratedIntColumn _habitId;
  @override
  GeneratedIntColumn get habitId => _habitId ??= _constructHabitId();
  GeneratedIntColumn _constructHabitId() {
    return GeneratedIntColumn(
      'habit_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, habitId, date, note];
  @override
  $EntriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'entries';
  @override
  final String actualTableName = 'entries';
  @override
  VerificationContext validateIntegrity(Insertable<Entrie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('habit_id')) {
      context.handle(_habitIdMeta,
          habitId.isAcceptableOrUnknown(data['habit_id'], _habitIdMeta));
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Entrie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Entrie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $EntriesTable createAlias(String alias) {
    return $EntriesTable(_db, alias);
  }
}

class Reminder extends DataClass implements Insertable<Reminder> {
  final int id;
  final int habitId;
  final DateTime date;
  Reminder({@required this.id, @required this.habitId, @required this.date});
  factory Reminder.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Reminder(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      habitId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}habit_id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || habitId != null) {
      map['habit_id'] = Variable<int>(habitId);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      habitId: habitId == null && nullToAbsent
          ? const Value.absent()
          : Value(habitId),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory Reminder.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Reminder(
      id: serializer.fromJson<int>(json['id']),
      habitId: serializer.fromJson<int>(json['habitId']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habitId': serializer.toJson<int>(habitId),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Reminder copyWith({int id, int habitId, DateTime date}) => Reminder(
        id: id ?? this.id,
        habitId: habitId ?? this.habitId,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(habitId.hashCode, date.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.date == this.date);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<int> id;
  final Value<int> habitId;
  final Value<DateTime> date;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.date = const Value.absent(),
  });
  RemindersCompanion.insert({
    this.id = const Value.absent(),
    @required int habitId,
    @required DateTime date,
  })  : habitId = Value(habitId),
        date = Value(date);
  static Insertable<Reminder> custom({
    Expression<int> id,
    Expression<int> habitId,
    Expression<DateTime> date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (date != null) 'date': date,
    });
  }

  RemindersCompanion copyWith(
      {Value<int> id, Value<int> habitId, Value<DateTime> date}) {
    return RemindersCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<int>(habitId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, Reminder> {
  final GeneratedDatabase _db;
  final String _alias;
  $RemindersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _habitIdMeta = const VerificationMeta('habitId');
  GeneratedIntColumn _habitId;
  @override
  GeneratedIntColumn get habitId => _habitId ??= _constructHabitId();
  GeneratedIntColumn _constructHabitId() {
    return GeneratedIntColumn(
      'habit_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, habitId, date];
  @override
  $RemindersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'reminders';
  @override
  final String actualTableName = 'reminders';
  @override
  VerificationContext validateIntegrity(Insertable<Reminder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('habit_id')) {
      context.handle(_habitIdMeta,
          habitId.isAcceptableOrUnknown(data['habit_id'], _habitIdMeta));
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reminder map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Reminder.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(_db, alias);
  }
}

abstract class _$NewDayDB extends GeneratedDatabase {
  _$NewDayDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $HabitsTable _habits;
  $HabitsTable get habits => _habits ??= $HabitsTable(this);
  $EntriesTable _entries;
  $EntriesTable get entries => _entries ??= $EntriesTable(this);
  $RemindersTable _reminders;
  $RemindersTable get reminders => _reminders ??= $RemindersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [habits, entries, reminders];
}
