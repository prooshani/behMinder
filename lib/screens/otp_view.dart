import 'dart:ui';

import 'package:beh_minder/main.dart';
import 'package:beh_minder/networking/user_verification.dart';
import 'package:beh_minder/screens/controllers/otp_controller.dart';
import 'package:beh_minder/screens/home_view.dart';
import 'package:beh_minder/services/routes.dart';
import 'package:beh_minder/tools/my_widgets.dart';
import 'package:beh_minder/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPView extends GetView<OTPViewController> {
  static const String id = 'OTPView';
  final String phoneNumber;
  String keyCode;

  OTPView({Key? key, required this.phoneNumber, required this.keyCode}) : super(key: key);

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
          ),
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
            child: Form(
              key: controller.otpFormKey,
              child: PinCodeTextField(
                errorTextMargin: const EdgeInsets.only(top: 8),
                errorTextDirection: TextDirection.rtl,
                animationDuration: const Duration(milliseconds: 500),
                errorAnimationController: controller.errorController,
                textStyle: farsiTextDecorationVazir.copyWith(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 22),
                hintCharacter: '0',
                hintStyle: farsiTextDecorationVazir,
                controller: controller.pinCode,
                validator: (String? pin) {
                  if (controller.pinValid == false) {
                    controller.errorController.add(ErrorAnimationType.shake);
                    return 'کد وارد شده صحیح نمی‌باشد.';
                  } else {
                    return null;
                  }
                },
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
                  inactiveColor: Colors.lightBlueAccent,
                  errorBorderColor: Colors.redAccent,
                ),
                appContext: context,
                length: 4,
                onChanged: (String? pin) {
                  controller.pinValid = null;
                  pin?.length == 4 ? controller.submitEnabled.value = true : controller.submitEnabled.value = false;
                },
                onCompleted: (String pin) {
                  controller.submitEnabled.value = true;
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => myElevatedButton(
                onPressed: () async {
                  //TODO: confirm the Pin number and navigate to the Home Page
                  var token = await controller.verifyUser(
                      username: phoneNumber.removeAllWhitespace, keyCode: keyCode, pinCode: int.parse(controller.pinCode.text));
                  if (token != null) {
                    controller.pinValid = true;
                    controller.otpFormKey.currentState?.validate();
                    print('token: $token');
                    successSnackBar(
                        successTitle: 'ورود موفق', successMessage: '${phoneNumber.removeAllWhitespace} خوش آمدید.', duration: 3);
                    //TODO: store username and token in sharedPreferences for next time use
                    userPrefs.setString('username', phoneNumber.removeAllWhitespace);
                    userPrefs.setString('token', token);
                    userPrefs.setBool('loggedIn', true);

                    // After successful login move to home page
                    Get.to(() => HomeView(phoneNumber: phoneNumber.removeAllWhitespace, token: token));
                  } else {
                    controller.pinValid = false;
                    controller.otpFormKey.currentState?.validate();

                    failedSnackBar(errorTitle: 'خطا در تائید کد', errorMessage: 'کد تائید وارد شده صحیح نمی‌باشد.', duration: 3);
                  }
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
                    onPressed: () async {
                      //TODO: Resend Pin Code routine here

                      keyCode = (await requestPin(username: phoneNumber.removeAllWhitespace))!;
                      controller.pinCode.clear();
                      successSnackBar(
                          successTitle: 'ارسال موفق',
                          successMessage: ' کد ورود جدید برای شماره‌ی ${phoneNumber.removeAllWhitespace} '
                              'ارسال شد',
                          duration: 3);
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
