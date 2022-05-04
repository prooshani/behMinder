import 'package:beh_minder/screens/controllers/appointments_controller.dart';
import 'package:beh_minder/screens/controllers/events_controller.dart';
import 'package:beh_minder/screens/controllers/home_controller.dart';
import 'package:beh_minder/screens/controllers/login_controller.dart';
import 'package:beh_minder/screens/controllers/otp_controller.dart';
import 'package:beh_minder/screens/controllers/signup_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewController>(() => LoginViewController());
    Get.lazyPut<SignupViewController>(() => SignupViewController());
    Get.lazyPut<OTPViewController>(() => OTPViewController());
    Get.lazyPut<HomeViewController>(() => HomeViewController());
    Get.lazyPut<AppointmentsViewController>(() => AppointmentsViewController());
    Get.lazyPut<EventsViewController>(() => EventsViewController());
  }
}
