import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OTPViewController extends GetxController {
  TextEditingController pinCode = TextEditingController();
  RxBool submitEnabled = false.obs;
}
