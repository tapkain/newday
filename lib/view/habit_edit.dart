import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:newday/repo/db/db.dart';
import 'package:newday/repo/db/model/model.dart';
import 'package:provider/provider.dart';

import '../repo/repo.dart';
import '../router.gr.dart';

class HabitEditView extends StatefulWidget {
  final FullHabit habit;

  const HabitEditView({this.habit});

  @override
  _HabitEditViewState createState() => _HabitEditViewState();
}

class _HabitEditViewState extends State<HabitEditView> {
  Habit habit;
  final fbKey = GlobalKey<FormBuilderState>();

  bool get isEditMode => widget.habit != null;

  @override
  void initState() {
    var colors = Colors.primaries.toList();
    colors = colors..shuffle();
    habit = widget.habit?.habit ??
        Habit(
          id: null,
          title: null,
          color: colors.first.value,
          goalPerDay: null,
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: fbKey,
        onChanged: (_) => setState(() {}),
        initialValue: habit.toJson(),
        autovalidate: true,
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Text(
            isEditMode ? 'Edit Habit' : 'Create Habit',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 20),
          FormBuilderTextField(
            attribute: 'title',
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
            validators: [
              FormBuilderValidators.minLength(6),
              FormBuilderValidators.maxLength(35),
            ],
          ),
          SizedBox(height: 20),
          FormBuilderTouchSpin(
            decoration: InputDecoration(labelText: 'Reps per day'),
            attribute: 'goalPerDay',
            initialValue: 1,
            step: 1,
          ),
          SizedBox(height: 20),
          isEditMode && widget.habit.entries.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${widget.habit.entries.length} Entries',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    FlatButton(
                      child: Text(
                        'see all >',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .apply(color: Colors.lightBlue),
                      ),
                      onPressed: () => ExtendedNavigator.of(context).pushNamed(
                          Routes.entryListRoute,
                          arguments:
                              EntryListViewArguments(habit: widget.habit)),
                    ),
                  ],
                )
              : Container(),
          RaisedButton(
            child: Text('Save'),
            onPressed:
                fbKey.currentState == null || !fbKey.currentState.validate()
                    ? null
                    : onFinish,
          ),
          isEditMode
              ? RaisedButton(
                  child: Text('Delete'),
                  onPressed: fbKey.currentState == null ||
                          !fbKey.currentState.validate()
                      ? null
                      : onDelete,
                )
              : Container(),
        ],
      ),
    );
  }

  void onDelete() async {
    try {
      await Provider.of<NewDayDB>(context, listen: false).deleteHabit(habit);
      ExtendedNavigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  void onFinish() async {
    try {
      await Provider.of<NewDayDB>(context, listen: false)
          .upsertHabit(Habit.fromJson(
        fbKey.currentState.value,
      ));
      ExtendedNavigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }
}
