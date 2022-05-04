import 'package:beh_minder/services/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  @override
  State<SplashScreen> createState() => _State();
}

class _State extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // اگر کیبورد باز هست باید قبل از شروع بسته شود
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    //TODO:چک شود آیا کاربر قبلا وارد شده است؟
    //TODO:چنانچه کاربر قبلاً وارد شده است به صفحه خانه منتقل شود
    //TODO:چنانچه کاربر وارد نشده به صفحه‌ی ورود منتقل شود

    Future.delayed(const Duration(seconds: 3)).whenComplete(() => Get.toNamed(AppRoutes.login));
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('./images/splash.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
