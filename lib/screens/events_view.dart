import 'package:beh_minder/screens/controllers/events_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsView extends GetView<EventsViewController> {
  static const String id = 'EventsView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('سررسیدها'),
      ),
    );
  }
}
