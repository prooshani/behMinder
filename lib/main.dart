import 'package:beh_minder/screens/otp_view.dart';
import 'package:beh_minder/screens/signup_view.dart';
import 'package:beh_minder/services/home_binding.dart';
import 'package:beh_minder/services/routes.dart';
import 'package:beh_minder/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beh_minder/screens/home_view.dart';
import 'package:beh_minder/screens/events_view.dart';
import 'package:beh_minder/screens/login_view.dart';
import 'package:beh_minder/screens/appointments_view.dart';
import 'package:beh_minder/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences userPrefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize the shared preferences to store user credentials and events locally
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  userPrefs = await _prefs;

  runApp(BehMinder());
}

class BehMinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'بهترینو - یادآور امور',

        navigatorKey: Get.key, //  define GetX navigation key to pass all over the screens and controllers
        debugShowCheckedModeBanner: false,
        onInit: () {}, //دستورات حین بارگذاری
        onReady: () {}, // دستورات پس از بارگذاری و آماده به کار
        onDispose: () {}, // دستورات لازم برای هنگام غیرفعال کردن

        darkTheme: darkMode.value ? ThemeData.dark() : ThemeData.light(),
        themeMode: darkMode.value ? ThemeMode.dark : ThemeMode.light,
        defaultTransition: Transition.noTransition,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialBinding: HomeBinding(),
        initialRoute: SplashScreen.id,
        home: HomeView(phoneNumber: '', token: ''),

        routes: {
          SplashScreen.id: (BuildContext context) => SplashScreen(),
          LoginView.id: (BuildContext context) => LoginView(),
          SignupView.id: (BuildContext context) => SignupView(),
          OTPView.id: (BuildContext context) => OTPView(
                phoneNumber: '',
                keyCode: '',
              ),
          HomeView.id: (BuildContext context) => HomeView(phoneNumber: '', token: ''),
          AppointmentsView.id: (BuildContext context) => AppointmentsView(),
          EventsView.id: (BuildContext context) => EventsView(),
        },
      ),
    );
  }
}
