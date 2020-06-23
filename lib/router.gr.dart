// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:newday/view/home.dart';
import 'package:newday/view/habit_edit.dart';
import 'package:moor_db_viewer/src/screen/moor_db_viewer_widget.dart';
import 'package:moor/moor.dart';

abstract class Routes {
  static const homeRoute = '/';
  static const habitEditRoute = '/habit-edit-route';
  static const moorDbRoute = '/moor-db-route';
  static const all = {
    homeRoute,
    habitEditRoute,
    moorDbRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.habitEditRoute:
        if (hasInvalidArgs<HabitEditViewArguments>(args)) {
          return misTypedArgsRoute<HabitEditViewArguments>(args);
        }
        final typedArgs =
            args as HabitEditViewArguments ?? HabitEditViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HabitEditView(habit: typedArgs.habit),
          settings: settings,
        );
      case Routes.moorDbRoute:
        if (hasInvalidArgs<MoorDbViewerArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<MoorDbViewerArguments>(args);
        }
        final typedArgs = args as MoorDbViewerArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => MoorDbViewer(typedArgs.db),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//HabitEditView arguments holder class
class HabitEditViewArguments {
  final dynamic habit;
  HabitEditViewArguments({this.habit});
}

//MoorDbViewer arguments holder class
class MoorDbViewerArguments {
  final GeneratedDatabase db;
  MoorDbViewerArguments({@required this.db});
}
