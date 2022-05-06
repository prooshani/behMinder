import 'package:beh_minder/screens/controllers/events_controller.dart';
import 'package:beh_minder/screens/controllers/home_controller.dart';
import 'package:beh_minder/screens/new_event_view.dart';
import 'package:beh_minder/tools/my_widgets.dart';
import 'package:beh_minder/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeViewController> {
  static const String id = 'HomeView';

  final String phoneNumber;
  final String token;

  // We got phone number and the token which passed from previous page (otp_view) to use

  HomeView({Key? key, required this.phoneNumber, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFE5E5E5),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // the new event button (top left) as a shortcut to create an event
                    IconButton(
                        onPressed: () async {
                          Get.to(() => NewEventView(
                                phoneNumber: phoneNumber.removeAllWhitespace, // remove any possible spaces from the phone number
                                token: token,
                                selectedTime: const [0, 0],
                              ));
                        },
                        icon: const Icon(FontAwesomeIcons.calendarPlus)),
                    // the current date and weekday (Top center)
                    Text(
                      jalaliDateNow(),
                      style: farsiTextDecorationVazir.copyWith(fontWeight: FontWeight.w800),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                    ),
                    // home menu (top right menu) from the home controller
                    Padding(padding: const EdgeInsets.only(right: 10), child: controller.homeMenu()),
                  ],
                ),
              ),
              // The main timeline (AKA appointments' calendar) here
              //TODO: this part has a lot of job to do to complete the challenge, the 4-day pace is not enough though.

              SingleChildScrollView(
                child: Row(
                  children: [
                    // event's timeline (left panel) defined here
                    Container(
                      clipBehavior: Clip.antiAlias,
                      width: Get.width * 0.8,
                      height: Get.height * 0.74,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
                          border: Border.all(color: Colors.purpleAccent, width: 0.3)),
                      child: Obx(
                        () => ListView.builder(
                          controller: controller.fieldListScroller.value,
                          itemCount: 96, // 24*4=96 number of containers we would need for the timeline
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                //it will highlight the tapped timeline container
                                controller.selectedIndex.value = index;
                                print(controller.selectedIndex.value);
                                print(index);
                              },
                              //it will pop the new event's page according to the longPressed container from the timeline
                              onLongPress: () {
                                int currentHour = index ~/ 4;
                                int currentMinute = (index * 15).remainder(60);

                                Get.to(() => NewEventView(
                                    phoneNumber: phoneNumber, token: token, selectedTime: [currentHour, currentMinute]));
                              },
                              child: Obx(
                                () => Container(
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: controller.selectedIndex.value == index ? Colors.blue.shade100 : Colors.transparent,
                                      border: Border(
                                          top: BorderSide(
                                              color: ((index * 15).remainder(60)) == 0 ? Colors.black54 : Colors.black26,
                                              width: ((index * 15).remainder(60)) == 0 ? 0.4 : 0.25))),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // time digits (right side) to show timeline's time spans.
                    Container(
                      width: Get.width * 0.19,
                      height: Get.height * 0.74,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Obx(
                        () => ListView.builder(
                          controller: controller.timeListScroller.value,
                          itemCount: 96, // 24*4 = 96 container would be created to create the timeline
                          itemBuilder: (context, index) {
                            int? timeSpan = 0;
                            return Container(
                              color: Colors.transparent,
                              height: 25,
                              child: (index.remainder(4)) == 0
                                  ? Text(
                                      (timeSpan + index / 4) < 10
                                          ? '0' + (timeSpan + index / 4).toInt().toString() + ':00'
                                          : (timeSpan + index / 4).toInt().toString() + ':00',
                                      style: farsiTextDecorationSahel,
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                    )
                                  : Container(),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
