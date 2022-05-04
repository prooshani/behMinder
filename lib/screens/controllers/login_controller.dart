import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginViewController extends GetxController {
  TextEditingController mobileTextController = TextEditingController();
  RxBool submitEnabled = false.obs;
}
