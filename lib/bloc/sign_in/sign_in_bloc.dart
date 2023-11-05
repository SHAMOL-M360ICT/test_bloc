// ignore_for_file: unused_catch_clause

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/configure/app_constants.dart';
import 'package:bloc_test/model/post/login.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  int id = 0, applicationId = 0, lastFilledPart = 0;
  bool mobileNumberVerification = false, emailVerification = false;
  Data? data;
  String name             = '',
      email               = '',
      password            = '',
      mobileNumber        = '',
      token               = '',
      companyName         = '',
      status              = '',
      applicationStatus   = '',
      companyId           = '',
      membershipExpiryDate= '';

  SignInBloc() : super(SignInInitial()) {
    on<LoginEvent>((event, emit) async {
      var box = Hive.box('myBox');
      emit(SignInLoading());
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        final response = LoginSuccessModel();
        try {
          Uri url = Uri.parse('$baseUrl/auth/member/login');
          final response = await http.post(url,
              body: jsonEncode(<String, String>{
                'email': event.email,
                'password': event.password
              }),
              headers: {
                'Content-Type': 'application/json',
              }).timeout(const Duration(seconds: 45));

          final body = loginSuccessFromJson(response.body.toString());
          if (body.success == true) {
            token = body.token!;
            data  = body.data!;
            box.put('email', event.email);
            box.put('password', event.password);
            box.put('token', token);
            emit(LoginSuccess());
          } else {
            emit(LoginException(message: '${body.message}'));
          }
        } on TimeoutException catch (e) {
          response.success = false;
          response.title = 'Timeout';
          response.message = 'Please try again';
        } on SocketException catch (e) {
          response.success = false;
          response.title = 'Connection Failed';
          response.message = 'Check your internet connection';
        } on Exception catch (e) {
          response.success = false;
          response.title = 'Warning';
          response.message = 'Please try again';
        }
      } else if (event.email.isEmpty) {
        emit(const LoginException(message: 'Please enter your email'));
      } else if (event.password.isEmpty) {
        emit(const LoginException(message: 'Please enter your password'));
      }
    });

    on<VisiblePasswordEvent>((event, emit) async {
      if(event.visible == false){
        emit(VisiblePasswordState());
      } else{
        emit(InVisiblePasswordState());
      }
      // print('soton: ${!event.visible}');
    });
  }
}
