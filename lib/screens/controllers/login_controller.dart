import 'package:beh_minder/networking/api_networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// The login Page's controller which keeps the variable,functions and widgets we are using in login view
class LoginViewController extends GetxController {
  TextEditingController mobileTextController = TextEditingController(); // username(phoneNumber textController)
  RxBool submitEnabled = false.obs; // This is to control the submitButton's enabled/disabled states

  // this function will call an api from api_networking to send a login request to the server
  Future submitUser({required String username}) async {
    var key = await requestPin(username: username);

    return key;
  }
}
