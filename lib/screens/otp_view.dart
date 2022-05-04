import 'package:beh_minder/screens/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPView extends GetView<OTPViewController> {
  static const String id = 'OTPView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('OTP'),
      ),
    );
  }
}
