/*
Custom Alart Dialog
@Author: Shamol Kumar Das <shamol.m360ict@gmail.com>
Start Date: 14-10-2023
Update Date: 14-10-2023
*/

import 'package:flutter/cupertino.dart';

Future<void> customAlertDialog(BuildContext context, String title, String content,
    {List<Widget> actions = const <Widget>[],
    bool barrierDismissible = false}) async {
  showCupertinoDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) => CupertinoAlertDialog(
      title: Text(title),
      content: content.isEmpty ? null : Text(content),
      actions: actions,
    )
  );
}