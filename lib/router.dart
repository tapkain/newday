import 'package:auto_route/auto_route_annotations.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';

import 'view/view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeView homeRoute;

  @MaterialRoute()
  HabitEditView habitEditRoute;

  @MaterialRoute()
  MoorDbViewer moorDbRoute;

  @MaterialRoute()
  EntryListView entryListRoute;
}
