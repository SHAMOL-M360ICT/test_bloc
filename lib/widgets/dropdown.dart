/*
Custom Dropdown Button
@Author: Shamol Kumar Das <shamol.m360ict@gmail.com>
Start Date: 14-10-2023
Update Date: 14-10-2023
*/

// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:bloc_test/configure/app_colors.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({Key? key, this.icon, this.dropDownButton, this.dateText, this.zero}) : super(key: key);
  
  Icon? icon;
  var dropDownButton;
  final Text? dateText;
  double? zero;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(top: h*0.012, bottom: zero ?? h*0.022, left: w*0.064, right: w*0.064),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 1),
        height: 54,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.greyColor)
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon!,
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child:
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20, top: 0, bottom: 0),
                      child: dropDownButton,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
    );
 }
}