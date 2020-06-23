import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:newday/repo/db/db.dart';

import '../repo/repo.dart';

class EntryEditView extends StatefulWidget {
  final Entrie entry;
  final Habit habit;

  const EntryEditView({this.entry, this.habit});

  @override
  _EntryEditViewState createState() => _EntryEditViewState();
}

class _EntryEditViewState extends State<EntryEditView> {
  Entrie entry;
  final fbKey = GlobalKey<FormBuilderState>();

  bool get isEditMode => widget.entry != null;

  @override
  void initState() {
    var colors = Colors.primaries.toList();
    colors = colors..shuffle();
    entry = widget.entry ??
        Entrie(
          id: null,
          habitId: widget.habit.id,
          date: DateTime.now(),
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: fbKey,
        onChanged: (_) => setState(() {}),
        initialValue: entry.toJson(),
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
            isEditMode ? 'Edit Entry' : 'Create Entry',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 20),
          FormBuilderTextField(
            maxLines: 5,
            attribute: 'note',
            decoration: InputDecoration(
              labelText: 'Note',
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
            validators: [
              FormBuilderValidators.minLength(2),
            ],
          ),
          SizedBox(height: 20),
          RaisedButton(
            child: Text('Save'),
            onPressed:
                fbKey.currentState == null || !fbKey.currentState.validate()
                    ? null
                    : onFinish,
          ),
        ],
      ),
    );
  }

  void onFinish() async {
    ExtendedNavigator.of(context)
        .pop(Entrie.fromJson(fbKey.currentState.value));
  }
}
