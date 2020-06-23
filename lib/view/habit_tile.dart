import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:newday/repo/db/db.dart';
import 'package:newday/repo/db/model/model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'entry_edit.dart';

class HabitTile extends StatelessWidget {
  final FullHabit habit;
  final Function onEntryInsert;
  final Function onDismissed;

  HabitTile({this.habit, this.onEntryInsert, this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Dismissible(
        confirmDismiss: (_) => _showConfirmDeleteAlert(context),
        onDismissed: (_) => onDismissed(),
        key: ValueKey(habit.habit.id),
        child: GestureDetector(
          onLongPress: () => showModalBottomSheet(
              context: context,
              builder: (_) => EntryEditView(
                    habit: habit.habit,
                  )).then(onEntryInsert),
          onTap: () => onEntryInsert(Entrie(
            id: null,
            habitId: habit.habit.id,
            date: DateTime.now(),
          )),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              PieChart(PieChartData(
                startDegreeOffset: 270,
                borderData: FlBorderData(show: false),
                sections: [
                  PieChartSectionData(
                    color: Theme.of(context).accentColor,
                    value: habit.entries.length.toDouble(),
                    showTitle: false,
                  ),
                  PieChartSectionData(
                    color: Color(habit.habit.color),
                    value: (habit.habit.goalPerDay - habit.entries.length)
                        .toDouble(),
                    showTitle: false,
                  ),
                ],
              )),
              Text(
                '${habit.entries.length}/${habit.habit.goalPerDay}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          habit.habit.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Future<bool> _showConfirmDeleteAlert(BuildContext context) {
    return Alert(
      context: context,
      type: AlertType.warning,
      title: 'Delete habit?',
      desc: 'Do you want to remove ${habit.habit.title}?',
      buttons: [
        DialogButton(
          child: Text(
            'YES',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context).pop(true),
        ),
        DialogButton(
          child: Text(
            'NO',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context).pop(false),
        )
      ],
    ).show();
  }
}
