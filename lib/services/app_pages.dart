import 'package:beh_minder/screens/appointments_page.dart';
import 'package:beh_minder/screens/events_page.dart';
import 'package:beh_minder/screens/home_page.dart';
import 'package:beh_minder/screens/login_page.dart';
import 'package:beh_minder/services/home_binding.dart';
import 'package:beh_minder/services/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.events,
      page: () => EventsPage(),
    ),
    GetPage(
      name: AppRoutes.appointments,
      page: () => AppointmentsPage(),
    ),
  ];
}
