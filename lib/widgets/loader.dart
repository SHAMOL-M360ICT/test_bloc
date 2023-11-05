/*
Custom Loader
@Author: Shamol Kumar Das <shamol.m360ict@gmail.com>
Start Date: 14-10-2023
Update Date: 14-10-2023
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//!App loader
void loader(BuildContext context) {
  CupertinoAlertDialog alert= const CupertinoAlertDialog(
    content: Column(
      children: [
        CupertinoActivityIndicator(),
        SizedBox(height: 6,),
        Text("Loading"),
      ],),
  );
  showCupertinoDialog(
    barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}

//!App linear loader
void linearLoader(BuildContext context,String msg) {
    CupertinoAlertDialog alert= CupertinoAlertDialog(
    content: Column(
      children: [
        Text("$msg\n"),
        const LinearProgressIndicator(),
      ],),
  );
  showCupertinoDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
  }