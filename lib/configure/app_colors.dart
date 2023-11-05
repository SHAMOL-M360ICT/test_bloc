/*
App Colors Control
@Author: Shamol Kumar Das <shamol.m360ict@gmail.com>
Start Date: 14-10-2023
Update Date: 29-10-2023
*/

import 'package:flutter/material.dart';

class AppColors{
  static const primaryColor     = Color(0xFF00B904);
  static const secondaryColor   = Color(0xFF131418);
  static var backgroundColor    = Colors.grey.shade200;
  static const iconColor        = Color(0xFF131418);//0xFF0F172A
  static var shadowColor        = Colors.grey.shade200;
  static const appBarColor      = Colors.white;
  static const redColor         = Colors.redAccent;
  static const greyColor        = Colors.grey;
  static const textColor        = Color(0xFFffffff);
  static const grayLight        = Colors.black87;
  static final gradientColor    = [const Color(0xFF00B904), Colors.white];
}

class AppStyle{
  static const titleText          = TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.primaryColor);
  static const timingText         = TextStyle(color: Colors.white);
  static const appTitle           = 'TOAB Member';
  static const checkOutStyle      = TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.textColor);
  static const checkOutTextStyle  = TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor);
  static const title1             = TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: AppColors.iconColor);
  static const regTitle           = TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: AppColors.primaryColor);
  static const title3             = TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.textColor);
  static const title4             = TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.greyColor);
  static const title3Override     = TextStyle(fontWeight: FontWeight.w200, fontSize: 14, color: AppColors.iconColor);
  static const bodyText1          = TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: AppColors.textColor);
  static const bodyText1Override  = TextStyle(fontWeight: FontWeight.w700, fontSize: 22, color: AppColors.textColor);
  static const buttonStyle        = TextStyle(color: Color(0xFFffffff), fontSize: 18, fontWeight: FontWeight.w800);
  static const tableTitle         = TextStyle(fontWeight: FontWeight.w600, color: AppColors.iconColor);
}

class AppSize{
  static double height(context) => MediaQuery.of(context).size.height;
  static double width(context) => MediaQuery.of(context).size.width;
  
  static const borderRadiusSize       = 12.00;
  static const subCategoryLeftPadding = 30.00;
}

class AddModel {
  dynamic name;
  bool isSelected1, isSelected2, isSelected3, isSelected4;
  AddModel(this.name, this.isSelected1, this.isSelected2, this.isSelected3, this.isSelected4);
}

class AnswerModel {
  String questionId, answer;
  AnswerModel(this.questionId, this.answer);
}