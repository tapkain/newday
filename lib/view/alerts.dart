import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import '../repo/repo.dart';

class Alerts {
  static Future<bool> showToast(BuildContext context, String message) {
    return showFlash<bool>(
      context: context,
      builder: (context, controller) {
        Future.delayed(Duration(seconds: 2), () {
          controller.dismiss();
        });

        return Flash.bar(
          backgroundColor: Colors.black87,
          style: FlashStyle.floating,
          position: FlashPosition.top,
          controller: controller,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: FlashBar(
            message: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .apply(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  static Future<bool> showDeleteHabitAlert(BuildContext context, Habit habit) {
    return showFlash<bool>(
      context: context,
      persistent: false,
      builder: (context, controller) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Flash.dialog(
              controller: controller,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: FlashBar(
                title: Text('Delete Habit?'),
                message: Text('Do you want to delete ${habit.title}?'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('DELETE'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('CANCEL'),
                    onPressed: () {},
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
