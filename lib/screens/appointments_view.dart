import 'package:beh_minder/screens/controllers/appointments_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentsView extends GetView<AppointmentsViewController> {
  static const String id = 'AppointmentsView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('قرارها'),
      ),
    );
  }
}
