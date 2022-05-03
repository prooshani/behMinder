import 'package:beh_minder/screens/appointments_page.dart';
import 'package:beh_minder/screens/events_page.dart';
import 'package:beh_minder/screens/home_page.dart';
import 'package:beh_minder/screens/login_page.dart';
import 'package:beh_minder/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String home = '/home';
  static const String login = '/login';
  static const String appointments = '/appointments';
  static const String events = '/events';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case home:
            return HomePage();
          case appointments:
            return AppointmentsPage();
          case events:
            return EventsPage();
          case splashScreen:
            return SplashScreen();
          case login:
          default:
            return LoginPage();
        }
      },
    );
  }
}
