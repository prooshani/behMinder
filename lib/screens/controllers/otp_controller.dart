import 'dart:async';

import 'package:beh_minder/networking/user_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPViewController extends GetxController {
  TextEditingController pinCode = TextEditingController();
  RxBool submitEnabled = false.obs;
  String? token;
  bool? pinValid;
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

  Future verifyUser({required String username, required String keyCode, required int pinCode}) async {
    var token = await verifyPin(username: username, keyCode: keyCode, pinCode: pinCode);

    return token;
  }

  @override
  void onInit() {
    super.onInit();
    pinCode.clear();
  }
}
