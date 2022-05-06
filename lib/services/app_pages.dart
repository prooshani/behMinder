import 'package:beh_minder/screens/new_event_view.dart';
import 'package:beh_minder/screens/events_view.dart';
import 'package:beh_minder/screens/home_view.dart';
import 'package:beh_minder/screens/login_view.dart';
import 'package:beh_minder/screens/otp_view.dart';
import 'package:beh_minder/screens/signup_view.dart';
import 'package:beh_minder/services/home_binding.dart';
import 'package:beh_minder/services/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => OTPView(
        phoneNumber: '',
        keyCode: '',
      ),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupView(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(phoneNumber: '', token: ''),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.events,
      page: () => EventsView(),
    ),
    GetPage(
      name: AppRoutes.newEvent,
      page: () => NewEventView(
        phoneNumber: '',
        token: '',
        selectedTime: const [0, 0],
      ),
    ),
  ];
}
