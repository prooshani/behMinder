import 'package:beh_minder/screens/controllers/login_controller.dart';
import 'package:beh_minder/screens/otp_view.dart';
import 'package:beh_minder/services/routes.dart';
import 'package:beh_minder/tools/decorations.dart';
import 'package:beh_minder/tools/my_widgets.dart';
import 'package:beh_minder/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginViewController> {
  static const String id = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'لطفاً شماره‌ی تلفن همراه خود را وارد کنید.',
                style: farsiTextDecorationVazir,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: Get.context!.isPhone
                  ? Get.context!.isPortrait
                      ? Get.width * 0.7
                      : Get.width * 0.3
                  : Get.context!.isPortrait
                      ? Get.width * 0.5
                      : Get.width * 0.3,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller.mobileTextController,
                inputFormatters: [mobileMaskFormatter],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? textValue) {
                  //TODO: disable send button if the mobile number field is not valid
                  if (textValue!.isEmpty) {
                    controller.submitEnabled.value = false;
                    return 'شماره‌ی تلفن همراه نباید خالی باشد';
                  } else if (textValue.length < 13) {
                    controller.submitEnabled.value = false;

                    return 'لطفاً شماره‌ی تلفن همراه خود را صحیح وارد کنید';
                  } else {
                    controller.submitEnabled.value = true;

                    return null;
                  }
                },
                style: farsiTextDecorationSahel.copyWith(fontSize: Get.context!.isPhone ? 20 : 24),
                decoration: kTextFieldEnabledDecoration.copyWith(
                  hintText: 'مثال: ۰۹۳۶۵۴۶۴۷۸۶',
                  hintTextDirection: TextDirection.rtl,
                ),
                textAlign: TextAlign.center,
                onChanged: (String? phoneNumber) {
                  phoneNumber?.length == 13 ? controller.submitEnabled.value = true : controller.submitEnabled.value = false;
                },
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => myElevatedButton(
                maxWidth: Get.context!.isPhone
                    ? Get.context!.isPortrait
                        ? Get.width * 0.7
                        : Get.width * 0.3
                    : Get.context!.isPortrait
                        ? Get.width * 0.5
                        : Get.width * 0.3,
                label: 'ارسال',
                enabled: controller.submitEnabled.value,
                onPressed: () async {
                  //TODO: فیلد شماره‌ی تلفن همراه چک شود و درصورتیکه خالی نبود به بخش ارسال کد منتقل شود
                  if (controller.mobileTextController.text != '') {
                    Get.to(
                      () => OTPView(
                        phoneNumber: controller.mobileTextController.text,
                      ),
                    );
                    successSnackBar(
                        successTitle: 'ارسال موفق',
                        successMessage: ' کد ورود برای شماره‌ی ${controller.mobileTextController.text.removeAllWhitespace} '
                            'ارسال شد',
                        duration: 3);
                  } else {
                    failedSnackBar(
                        errorTitle: 'خطا در '
                            'ارسال کد',
                        errorMessage: 'لطفاً شماره‌ی تلفن همراه را وارد کنید.',
                        duration: 3);
                  }
                  ;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
