import 'package:beh_minder/screens/controllers/login_controller.dart';
import 'package:beh_minder/tools/decorations.dart';
import 'package:beh_minder/tools/my_widgets.dart';
import 'package:beh_minder/tools/styles.dart';
import 'package:flutter/material.dart';
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
              width: Get.width * 0.7,
              child: TextFormField(
                inputFormatters: [mobileMaskFormatter],
                style: farsiTextDecorationSahel.copyWith(fontSize: 20),
                decoration: kTextFieldEnabledDecoration.copyWith(
                  hintText: 'مثال: ۰۹۳۶۵۴۶۴۷۸۶',
                  hintTextDirection: TextDirection.rtl,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            myElevatedButton(maxWidth: Get.width * 0.7, label: 'ارسال', onPressed: () async {}),
          ],
        ),
      ),
    );
  }
}
