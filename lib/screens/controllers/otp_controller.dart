import 'dart:async';

import 'package:beh_minder/networking/api_networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// This is OTP page controller which will keep variables, functions and controllers of the OTP Page view

class OTPViewController extends GetxController {
  TextEditingController pinCode = TextEditingController(); //TextController for the 4-digit pincode textfield
  RxBool submitEnabled = false.obs; // variable to control the submit button state (butoon disable/enable)

  String? token; //This is will keep the token received from server as a successful authentication.
  bool? pinValid; //This is to control the pincode textFields' validation state
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>(); // We use a global form state key to validate the pinCode textfield
  // This is an animation controller to shake the pinCode on invalid pin
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

  // This function will call when the user tap the submit button to submit the entered pin for validation
  // It will call an api from api_networking to send the entered pin besides the key we got from previous step (login request)
  // If the authentication was successful it will receive a token
  Future verifyUser({required String username, required String keyCode, required int pinCode}) async {
    var token = await verifyPin(username: username, keyCode: keyCode, pinCode: pinCode);

    return token;
  }

  @override
  void onInit() {
    super.onInit();

    pinCode.clear(); // clear the pinCode's field on view initialization
  }
}
