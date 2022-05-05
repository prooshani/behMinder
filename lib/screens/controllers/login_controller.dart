import 'package:beh_minder/networking/user_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginViewController extends GetxController {
  TextEditingController mobileTextController = TextEditingController();
  RxBool submitEnabled = false.obs;

  Future submitUser({required String username}) async {
    var key = await requestPin(username: username);
    return key;
  }
}
