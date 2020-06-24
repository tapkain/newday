import 'package:dropbox_client/dropbox_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/db.dart';

class Sync {
  String _accessToken;
  final NewDayDB db;

  final _dbInit = Dropbox.init(
    'newday.app',
    'bwx9366348g22ka',
    'g5fgxqnlx1lwb28',
  );

  Sync({this.db}) {
    Future.microtask(() async {
      await _dbInit;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _accessToken = prefs.getString('dropboxAccessToken');
    });
  }

  Future<bool> _authorize() async {
    if (!await _checkAuthorized()) {
      await Dropbox.authorize();
      return _checkAuthorized();
    }

    return true;
  }

  Future<bool> _checkAuthorized() async {
    final token = await Dropbox.getAccessToken();
    if (token != null) {
      if (_accessToken == null || _accessToken.isEmpty) {
        _accessToken = token;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('dropboxAccessToken', _accessToken);
      }
      return true;
    }

    if (_accessToken != null && _accessToken.isNotEmpty) {
      await Dropbox.authorizeWithAccessToken(_accessToken);
      final token = await Dropbox.getAccessToken();
      if (token != null) {
        print('authorizeWithAccessToken!');
        return true;
      }
    }

    return false;
  }

  Future<bool> sync() async {
    try {
      if (!await _authorize()) {
        return false;
      }

      //sync algo
      //if has local data - push to remote
      //if no data - pull from remote

      final path = await NewDayDB.dbPath();
      if (await db.hasHabits()) {
        print('UPLOADING');
        await Dropbox.upload(path, '/newday.db');
        return false;
      }

      print('DOWNLOADING');
      await Dropbox.download('/newday.db', path);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
