/*
App API Controller
@Author: Shamol Kumar Das <shamol.m360ict@gmail.com>
Start Date: 14-10-2023
Update Date: 29-10-2023
*/

// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, depend_on_referenced_packages, deprecated_member_use, unused_catch_clause
import 'dart:async';
import 'dart:io';
import 'package:bloc_test/configure/app_constants.dart';
import 'package:bloc_test/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


//!GET+POST+PUT+DELETE
class BaseClient {
  var client = http.Client();

  //!GET Request
  Future<dynamic> get(BuildContext context, String endPoint) async {
    try{
    Uri url = Uri.parse(baseUrl + endPoint);
    debugPrint('url: $url');
    var response = await client.get(url, headers: {
    // 'Authorization' : 'Bearer ${loginController.token}',
    'Content-Type':'application/json',
    }).timeout(const Duration(seconds: 45));
    var body = json.decode(response.body);
    var status = body['success'];
      if (status == 'true' || status == true) {
        return response.body;
      } else {
        debugPrint('Error from $endPoint: ${body['message']}');
        return null;
      }
    } on TimeoutException catch(e){
      wrongSnackBar(context, title: 'Timeout', 'Please try again');
  } on SocketException catch(e){
      wrongSnackBar(context, title: 'Connection Failed', 'Check your internet connection');
  } catch(e){
    debugPrint('Error from get registration an event: $e');
  }
  }

  //!POST Request
  Future<T> post<T>(String endPoint, myModel, {dynamic object}) async {
    final response = myModel;
    try{
    Uri url = Uri.parse(baseUrl + endPoint);
    var payload = json.encode(object);
    var response = await client.post(url, body: object != null ? payload : null, 
    headers: {
    // 'Authorization' : 'Bearer ${loginController.token}',
    'Content-Type':'application/json',
    }).timeout(const Duration(seconds: 45));
    final body = myModel.fromJson(response.body.toString());
    return body;
    } on TimeoutException catch (e) {
        response.success = false;
        response.title = 'Timeout';
        response.message = 'Please try again';
        return response;
      } on SocketException catch (e) {
        response.success = false;
        response.title = 'Connection Failed';
        response.message = 'Check your internet connection';
        return response;
      } on Exception catch(e){
        response.success = false;
        response.title = 'Warning';
        response.message = 'Please try again';
        return response;
    }
  }
}
