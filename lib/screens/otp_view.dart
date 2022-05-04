import 'dart:ui';

import 'package:beh_minder/screens/controllers/otp_controller.dart';
import 'package:beh_minder/services/routes.dart';
import 'package:beh_minder/tools/my_widgets.dart';
import 'package:beh_minder/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPView extends GetView<OTPViewController> {
  static const String id = 'OTPView';
  final String phoneNumber;

  OTPView({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'کد چهار رقمی ارسال شده به شماره‌ی\n ${phoneNumber.removeAllWhitespace} را وارد کنید.',
            textDirection: TextDirection.rtl,
            style: farsiTextDecorationVazir.copyWith(fontWeight: FontWeight.w700),
          ), //TODO: insert mobile number
          // from Login
          // page
          const SizedBox(height: 40),
          //TODO: // OPT fields here
          SizedBox(
            width: Get.context!.isPhone
                ? Get.context!.isPortrait
                    ? Get.width * 0.7
                    : Get.width * 0.3
                : Get.context!.isPortrait
                    ? Get.width * 0.5
                    : Get.width * 0.3,
            child: PinCodeTextField(
              textStyle: farsiTextDecorationVazir.copyWith(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 22),
              hintCharacter: '0',
              hintStyle: farsiTextDecorationVazir,
              controller: controller.pinCode,
              keyboardType: TextInputType.number,
              autoDismissKeyboard: true,
              enableActiveFill: true,
              pinTheme: PinTheme.defaults(
                  fieldHeight: 60,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(35),
                  borderWidth: 2,
                  activeColor: Colors.blue.shade500,
                  inactiveFillColor: Colors.blue.shade100,
                  activeFillColor: Colors.lightBlueAccent,
                  inactiveColor: Colors.lightBlueAccent),
              appContext: context,
              length: 4,
              onChanged: (String? pin) {
                pin?.length == 4 ? controller.submitEnabled.value = true : controller.submitEnabled.value = false;
              },
              onCompleted: (String pin) {
                controller.submitEnabled.value = true;
              },
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => myElevatedButton(
                onPressed: () async {
                  //TODO: confirm the Pin number and navigate to the Home Page
                  Get.toNamed(AppRoutes.home);
                },
                maxWidth: Get.context!.isPhone
                    ? Get.context!.isPortrait
                        ? Get.width * 0.7
                        : Get.width * 0.3
                    : Get.context!.isPortrait
                        ? Get.width * 0.5
                        : Get.width * 0.3,
                label: 'تائید',
                enabled: controller.submitEnabled.value),
          ),

          SizedBox(
            width: Get.context!.isPhone
                ? Get.context!.isPortrait
                    ? Get.width * 0.7
                    : Get.width * 0.3
                : Get.context!.isPortrait
                    ? Get.width * 0.5
                    : Get.width * 0.3,
            child: Center(
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      //TODO: Resend Pin Code routine here
                    },
                    child: Text(
                      'ارسال مجدد',
                      textDirection: TextDirection.rtl,
                      style: farsiTextDecorationSahel.copyWith(color: Colors.green, fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      //TODO: Change phoneNumber routine here
                      Get.toNamed(AppRoutes.login);
                    },
                    child: Text(
                      'تغییر شماره',
                      textDirection: TextDirection.rtl,
                      style: farsiTextDecorationSahel.copyWith(color: Colors.green, fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
