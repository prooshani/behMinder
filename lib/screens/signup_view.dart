import 'package:beh_minder/screens/controllers/login_controller.dart';
import 'package:beh_minder/screens/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignupViewController> {
  static const String id = 'SignupView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ثبت‌نام'),
      ),
    );
  }
}
