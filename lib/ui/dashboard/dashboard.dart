import 'package:bloc_test/bloc/sign_in/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final data = context.read<SignInBloc>().data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(data!.name.toString()),
            Text(data.email.toString()),
            Text(data.mobileNumber.toString()),
            Text(data.mobileNumberVerification.toString()),
            Text(data.emailVerification.toString()),
            Text(data.companyName.toString()),
            Text(data.status.toString()),
            Text(data.applicationId.toString()),
            Text(data.applicationStatus.toString()),
            Text(data.lastFilledPart.toString()),
            Text(data.companyId ?? ''),
            Text(data.membershipExpiryDate ?? ''),
          ],
        ),
      ),
    );
  }
}