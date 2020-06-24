import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newday/repo/db/model/model.dart';
import 'package:provider/provider.dart';

import '../repo/repo.dart';

class EntryListView extends StatefulWidget {
  final FullHabit habit;

  const EntryListView({this.habit});

  @override
  _EntryListViewState createState() => _EntryListViewState();
}

class _EntryListViewState extends State<EntryListView> {
  List<Entrie> entries;

  @override
  void initState() {
    entries = widget.habit.entries.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habit.habit.title),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final e = entries[index];
          final title = DateFormat('MM-dd – kk:mm').format(e.date);
          return Dismissible(
            background: Container(color: Colors.red),
            key: ValueKey(e.id),
            onDismissed: (_) {
              entries.removeAt(index);
              widget.habit.entries.removeAt(index);
              Provider.of<NewDayDB>(context, listen: false).deleteEntry(e);
              setState(() {});
            },
            child: ListTile(
              title: Text('$title'),
              subtitle: Text(
                e.note ?? '',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          );
        },
      ),
    );
  }
}
