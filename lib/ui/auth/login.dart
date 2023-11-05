/*
Login UI
@Author: Shamol Kumar Das <shamol.m360ict@gmail.com>
Start Date: 14-10-2023
Update Date: 14-10-2023
*/

// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use
import 'package:bloc_test/bloc/sign_in/sign_in_bloc.dart';
import 'package:bloc_test/configure/app_constants.dart';
import 'package:bloc_test/ui/dashboard/dashboard.dart';
import 'package:bloc_test/widgets/circular_progress.dart';
import 'package:bloc_test/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc_test/configure/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:bloc_test/widgets/button.dart';
import 'package:bloc_test/widgets/input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final differ = DateTime.now().difference(appFunctions.timeBackPressed);
        final exitWarning = differ >= const Duration(seconds: 2);
        appFunctions.timeBackPressed = DateTime.now();
        if (exitWarning) {
          appWidgets.exitAlertDialog(context, from: 'exit');
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const DashboardScreen()),
                  (route) => false);
            } else if (state is LoginException) {
              wrongSnackBar(context, state.message);
            }
          },
          child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomLeft,
                      colors: AppColors.gradientColor)),
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    //!Language controller
                    // SizedBox(height: h*0.25,),
                    const Center(
                        child: Text('TOAB Member', style: AppStyle.title3)),

                    SizedBox(
                      height: AppSize.height(context) * 0.05,
                    ),
                    //!Email
                    appWidgets.textTitle(title: 'Your Email', isRequired: true),
                    CustomInputField(
                      controller: emailController,
                      hintText: 'Your Email',
                      keyboardType: TextInputType.emailAddress,
                      icon: const Icon(
                        CupertinoIcons.mail,
                        color: AppColors.grayLight,
                        size: 25.0,
                      ),
                      autofillHints: AutofillHints.email,
                      bottom: 15.0,
                      isName: false,
                    ),
                    //!Password
                    appWidgets.textTitle(
                        title: 'Your Password', isRequired: true),
                    CustomInputField(
                        controller: passwordController,
                        hintText: 'Your Password',
                        keyboardType: TextInputType.visiblePassword,
                        icon: const Icon(
                          CupertinoIcons.lock,
                          color: AppColors.grayLight,
                          size: 25.0,
                        ),
                        autofillHints: AutofillHints.password,
                        obscureText: hidePassword,
                        bottom: 10.0,
                        isName: false,
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          child: hidePassword
                              ? const Icon(
                                  Icons.visibility_off_outlined,
                                  color: AppColors.greyColor,
                                )
                              : const Icon(
                                  Icons.visibility_outlined,
                                  color: AppColors.grayLight,
                                ),
                        )),
                    //!Forget Password
                    GestureDetector(
                        onTap: () {},
                        child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Forget Password?      ',
                              style: AppStyle.title3Override,
                            ))),
                    //!Login
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppSize.height(context) * 0.035,
                          bottom: AppSize.height(context) * 0.02,
                          left: AppSize.width(context) * 0.1,
                          right: AppSize.width(context) * 0.1),
                      child: BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) {
                          if (state is SignInLoading) {
                            return circularProgress();
                          } else {
                            return CustomButton(
                                text: 'Login',
                                color: AppColors.primaryColor,
                                press: () {
                                  context.read<SignInBloc>().add(LoginEvent(
                                      email: emailController.text,
                                      password: passwordController.text));
                                });
                          }
                        },
                      ),
                    ),
                    //!Register Now
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: const Duration(milliseconds: 400),child: const RegistrationScreen()));
                      },
                      child: Center(
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Don\'t have an account?',
                                  style: AppStyle.title1),
                              TextSpan(
                                  text: '  Register Now.',
                                  style: AppStyle.title1)
                            ],
                          ),
                          textScaleFactor: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
