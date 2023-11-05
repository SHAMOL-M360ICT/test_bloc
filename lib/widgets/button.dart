/*
Custom Button
@Author: Shamol Kumar Das <shamol.m360ict@gmail.com>
Start Date: 14-10-2023
Update Date: 14-10-2023
*/

import 'package:flutter/material.dart';
import 'package:bloc_test/configure/app_colors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,required this.text, required this.press, this.width, this.color, this.align}) : super(key: key);

  final String? text;
  final VoidCallback press;
  final Color? color;
  final double? width;
  final Alignment? align;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
      height: h*0.056,
      width: width != null ? w*0.45 : null,
      margin: EdgeInsets.only(left: w*0.01, right: w*0.01, bottom: h*0.015),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(48)),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 5,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: press,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: align ?? Alignment.center,
              child: Text(
                '$text',style: AppStyle.buttonStyle,
              ),
            ),
            Positioned(
              right: 0,
              child: ClipOval(
                  child: CircleAvatar(
                      radius: h*0.02,
                      backgroundColor: Colors.black.withOpacity(0.16),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                        size: h*0.035,
                      )
                  )
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}