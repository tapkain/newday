import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newday/repo/db/model/model.dart';
import 'package:provider/provider.dart';

import '../repo/repo.dart';
import 'habit_edit.dart';
import 'habit_tile.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  NewDayDB _db;
  List<FullHabit> _habits;
  StreamSubscription _habitSubscription;

  @override
  void initState() {
    Future.microtask(() async {
      _db = Provider.of<NewDayDB>(context, listen: false);
      _habits = await _db.allHabits();
      _habitSubscription = _db.watchHabits().listen((h) {
        _habits = h;
        setState(() {});
      });

      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _habitSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewDay'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (_) => HabitEditView(),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        'No habits',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget _buildBody() {
    if (_habits == null) {
      return Center(child: CircularProgressIndicator());
    }

    if (_habits.isEmpty) {
      return _buildEmptyState();
    }

    return GridView.builder(
      padding: EdgeInsets.all(20),
      itemCount: _habits.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return HabitTile(
          habit: _habits[index],
          onDismissed: () => _db.deleteHabit(_habits[index].habit),
          onEntryInsert: (entry) {
            if (entry == null) {
              return;
            }
            HapticFeedback.lightImpact();
            _habits[index].entries.add(entry);
            _db.upsertEntry(entry);
            setState(() {});
          },
        );
      },
    );
  }
}
