/*
App Global Widgets Control
@Author: Shamol Kumar Das <shamol.m360ict@gmail.com>
Start Date: 14-10-2023
Update Date: 29-10-2023
*/

// ignore_for_file: use_build_context_synchronously
import 'package:bloc_test/configure/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppWidgets {

  //!Text Title
  textTitle({required title, required isRequired, noSpace}){
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: noSpace !=null ? '$title' : '       $title'),
          TextSpan(
            text: isRequired ? ' *' : '',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
        ],
      ),
    );
  }

  //!for exit alert dialog
  exitAlertDialog(BuildContext context, {required from}) async {
    return await showCupertinoDialog(
        context: context,
        builder: (context){
          return CupertinoAlertDialog(
            title: const Text('Confirmation'),
            content: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Are you sure want to ${from == 'exit' ? 'exit' : 'logout'} from '),
                  TextSpan(
                    text: from == 'exit' ? 'TOAB Member?' : 'M360 ICT?',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: ()=> Navigator.of(context).pop(false),
                  child: Text(from == 'exit' ? 'NO' : 'CANCEL',style: const  TextStyle(color: AppColors.primaryColor),)
              ),
              TextButton(
                  onPressed: (){
                    SystemNavigator.pop();
                  },
                  child: Text(from == 'exit' ? 'EXIT' : 'LOGOUT',style: const TextStyle(color: AppColors.redColor),)
              ),
            ],
          );
        }
    );
  }
}