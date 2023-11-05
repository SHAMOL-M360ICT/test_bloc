/*
Custom Input Field
@Author: Shamol Kumar Das <shamol.m360ict@gmail.com>
Start Date: 14-10-2023
Update Date: 21-10-2023
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloc_test/configure/app_colors.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({super.key, required this.controller, required this.hintText,required this.keyboardType, this.suffixIcon, this.bottom, this.url, this.fieldName,
  required this.autofillHints, this.obscureText, this.readOnly, this.icon, this.prefixImageIcon, this.backgroundColor, this.zero, this.maxLine, this.autoFocus, required this.isName});
  
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? autofillHints;
  final bool? obscureText;
  final Icon? icon;
  final ImageIcon? prefixImageIcon;
  final bool? readOnly;
  final bool? autoFocus;
  final Color? backgroundColor;
  final double? zero;
  final InkWell? suffixIcon;
  final int? maxLine;
  final double? bottom;
  final String? url;
  final String? fieldName;
  final bool isName;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  
  Timer debounce = Timer(Duration.zero, () {});
  
  String? nameType;
  var names = ['Mr.', 'Ms.', 'Mrs.'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4, bottom: widget.bottom ?? 16, left: widget.zero ?? 25, right: widget.zero ?? 25),
      child: Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 1),
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.greyColor)
          ),
        child: Row(
        children: [
          widget.icon!,
          Expanded(
            child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText ?? false,
            autofillHints: [widget.autofillHints!],
            readOnly: widget.readOnly ?? false,
            textInputAction: TextInputAction.done,
            maxLines: widget.maxLine ?? 1,
            autofocus: widget.autoFocus ?? false,
          style: const TextStyle(fontSize: 17, letterSpacing: 1, color: AppColors.grayLight),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppColors.greyColor),
            isCollapsed: true,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: widget.suffixIcon,
            contentPadding: widget.isName ? EdgeInsets.zero : const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 12),
          ),
          inputFormatters: widget.keyboardType == TextInputType.number ? [
            FilteringTextInputFormatter.allow(RegExp('^[0-9]*')),
           ] : null,
                ),
              ),
            ],
          )),
    );
  }
}
