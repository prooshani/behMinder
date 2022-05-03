import 'package:beh_minder/screens/controllers/appointments_controller.dart';
import 'package:beh_minder/screens/controllers/events_controller.dart';
import 'package:beh_minder/screens/controllers/home_controller.dart';
import 'package:beh_minder/screens/controllers/login_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<AppointmentsPageController>(() => AppointmentsPageController());
    Get.lazyPut<EventsPageController>(() => EventsPageController());
  }
}
