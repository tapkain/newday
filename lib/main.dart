import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:newday/repo/db/db.dart';
import 'package:newday/repo/repo.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';

import 'router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(NewDayApp());
}

class NewDayApp extends StatefulWidget {
  @override
  _NewDayAppState createState() => _NewDayAppState();
}

class _NewDayAppState extends State<NewDayApp> {
  NewDayDB _db;
  ShakeDetector _shakeDetector;

  @override
  void initState() {
    _db = NewDayDB();

    _shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: () {
        ExtendedNavigator.rootNavigator.pushNamed(
          Routes.moorDbRoute,
          arguments: MoorDbViewerArguments(db: _db),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _db.close();
    _shakeDetector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: _db),
        Provider(
          create: (_) => Sync(db: _db),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator<Router>(router: Router()),
      ),
    );
  }
}
