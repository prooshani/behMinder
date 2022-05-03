import 'package:beh_minder/services/home_binding.dart';
import 'package:beh_minder/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:beh_minder/screens/home_page.dart';
import 'package:beh_minder/screens/events_page.dart';
import 'package:beh_minder/screens/login_page.dart';
import 'package:beh_minder/screens/appointments_page.dart';
import 'package:beh_minder/screens/splash_screen.dart';

Future<void> main() async {
  runApp(BehMinder());
}

class BehMinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        navigatorKey: Get.key, //  define GetX navigation key to pass all over the screens and controllers

        onInit: () {}, //دستورات حین بارگذاری
        onReady: () {}, // دستورات پس از بارگذاری و آماده به کار
        onDispose: () {}, // دستورات لازم برای هنگام غیرفعال کردن

        title: 'بهترینو - یادآور امور',

        darkTheme: darkMode.value ? ThemeData.dark() : ThemeData.light(),
        themeMode: darkMode.value ? ThemeMode.dark : ThemeMode.light,
        defaultTransition: Transition.noTransition,
        initialBinding: HomeBinding(),
        home: HomePage(),

        routes: {
          SplashScreen.id: (BuildContext context) => SplashScreen(),
          HomePage.id: (BuildContext context) => HomePage(),
          AppointmentsPage.id: (BuildContext context) => AppointmentsPage(),
          EventsPage.id: (BuildContext context) => EventsPage(),
          LoginPage.id: (BuildContext context) => LoginPage(),
        },
      ),
    );
  }
}
