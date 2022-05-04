import 'package:beh_minder/screens/appointments_view.dart';
import 'package:beh_minder/screens/events_view.dart';
import 'package:beh_minder/screens/home_view.dart';
import 'package:beh_minder/screens/login_view.dart';
import 'package:beh_minder/screens/otp_view.dart';
import 'package:beh_minder/screens/signup_view.dart';
import 'package:beh_minder/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String otp = '/otp';
  static const String appointments = '/appointments';
  static const String events = '/events';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case home:
            return HomeView();
          case appointments:
            return AppointmentsView();
          case events:
            return EventsView();
          case splashScreen:
            return SplashScreen();
          case signup:
            return SignupView();
          case otp:
            return OTPView(
              phoneNumber: '',
            );
          case login:
          default:
            return LoginView();
        }
      },
    );
  }
}
