/*
App Constants Control
@Author: Shamol Kumar Das <shamol.m360ict@gmail.com>
Start Date: 14-10-2023
Update Date: 29-10-2023
*/

import 'package:bloc_test/configure/app_widgets.dart';
import 'package:bloc_test/controller/api_controller.dart';
import 'package:bloc_test/functions/app_functions.dart';

//!Get X global variable
AppWidgets appWidgets     = AppWidgets();
AppFunctions appFunctions = AppFunctions();
BaseClient baseClient     = BaseClient();

//!Global variable
//test url = http://192.168.0.237:9007
//main url = https://toab.services

var url = 'https://toab.services';

var baseUrl       = '$url/api/v1';
var imageBaseUrl  = 'https://m360ict.s3.ap-south-1.amazonaws.com/toab-storage';

Future<void>? launched;