import 'package:beh_minder/screens/controllers/events_controller.dart';
import 'package:beh_minder/screens/controllers/home_controller.dart';
import 'package:beh_minder/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeViewController> {
  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('خانه'),
      ),
    );
  }
}
