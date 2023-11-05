/*
Custom Circular Progress
@Author: Shamol Kumar Das <shamol.m360ict@gmail.com>
Start Date: 14-10-2023
Update Date: 14-10-2023
*/

import 'package:flutter/cupertino.dart';
import 'package:bloc_test/configure/app_colors.dart';

circularProgress(){
    return const Center(child: Padding(
      padding: EdgeInsets.only(top: 16, bottom: 20),
      child: CupertinoActivityIndicator(color: AppColors.iconColor,),
    ));
  }