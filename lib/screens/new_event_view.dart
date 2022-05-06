import 'package:beh_minder/main.dart';
import 'package:beh_minder/networking/data_model_event.dart';
import 'package:beh_minder/screens/controllers/new_event_controller.dart';
import 'package:beh_minder/tools/decorations.dart';
import 'package:beh_minder/tools/my_widgets.dart';
import 'package:beh_minder/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class NewEventView extends GetView<NewEventViewController> {
  static const String id = 'NewEventView';
  final String phoneNumber;
  final String token;
  final List<int> selectedTime;

  // We got token and selected time (if any) from previous view (HomeView) to pass to the fields and submit purposes
  NewEventView({Key? key, required this.phoneNumber, required this.token, required this.selectedTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.eventHour.value = selectedTime[0];
    controller.eventMinute.value = selectedTime[1];
    controller.eventDuration.value = 0;
    controller.eventName.clear();
    controller.submitEnabled.value = false;
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'رویداد جدید',
          style: farsiTextDecorationVazir.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            FontAwesomeIcons.xmark,
            color: Colors.black,
          ),
        ),
      ),
      // Use a singleChildScrollView to make a safe working area on keyboard open state
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 35),
            Center(
              child: Container(
                width: Get.width * 0.9,
                height: Get.height * 0.16,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(color: Colors.pinkAccent.shade100, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, right: 20),
                      child: Text(
                        'نام رویداد',
                        textAlign: TextAlign.start,
                        style: farsiTextDecorationVazir.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          controller: controller.eventName,
                          textDirection: TextDirection.rtl,
                          validator: (String? nameValue) {
                            if (nameValue!.isEmpty) {
                              controller.submitEnabled.value = false;
                              return 'نام رویداد نباید خالی باشد';
                            } else {
                              controller.submitEnabled.value = true;
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (String? eventName) {
                            eventName!.isEmpty ? controller.submitEnabled.value = false : controller.submitEnabled.value = true;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'مانند: جشن نوروز',
                            hintTextDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: Get.width * 0.9,
                height: Get.height * 0.27,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(color: Colors.pinkAccent.shade100),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, right: 30),
                      child: Text(
                        'زمان رویداد',
                        textAlign: TextAlign.start,
                        style: farsiTextDecorationVazir.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'ساعت',
                                  textAlign: TextAlign.start,
                                  style: farsiTextDecorationVazir.copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
                                ),
                                myNumberPicker(
                                    minVal: 0, maxVal: 23, numberValue: controller.eventHour, fieldWidth: 160, zeroPadding: true),
                              ],
                            )),
                        Text(
                          ':',
                          style: farsiTextDecorationVazir.copyWith(color: Colors.blueGrey, fontSize: 25),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'دقیقه',
                                  textAlign: TextAlign.start,
                                  style: farsiTextDecorationVazir.copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
                                ),
                                myNumberPicker(
                                    minVal: 0,
                                    maxVal: 59,
                                    numberValue: controller.eventMinute,
                                    fieldWidth: 160,
                                    zeroPadding: true),
                              ],
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, right: 30),
                      child: Text(
                        'مدت زمان رویداد (دقیقه)',
                        textAlign: TextAlign.start,
                        style: farsiTextDecorationVazir.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 22.0, top: 5),
                          child: myNumberPicker(
                              minVal: 0, maxVal: 500, numberValue: controller.eventDuration, pickerWidth: 30, fieldWidth: 190),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Obx(
                () => myElevatedButton(
                    onPressed: () async {
                      // Convert start time and calculate the end time

                      controller.convertEventTime(
                          eventHour: controller.eventHour.value,
                          eventMinute: controller.eventMinute.value,
                          eventDuration: controller.eventDuration.value);

                      //Submit the event into the server.

                      DataModelEvent? eventData = await controller.submitNewEvent(
                          eventName: controller.eventName.text,
                          eventStart: controller.eventStart,
                          eventEnd: controller.eventEnd,
                          token: token);

                      //In case of successful event submit it will return the event's data to store in prefs

                      if (eventData!.id != null) {
                        print('Event Data: ${eventData.id}');

                        eventPrefs.setStringList(
                            eventData.id, [phoneNumber.removeAllWhitespace, eventData.name, eventData.start, eventData.end]);

                        //TODO: add the saved event to the homeView list here

                        Get.back();
                        successSnackBar(
                            successTitle: 'ثبت موفق',
                            successMessage: 'رویدادی با عنوان: ( ${controller.eventName.text} ) با موفقیت ثبت گردید. ',
                            duration: 4);
                      } else {
                        failedSnackBar(
                            errorTitle: 'خطا در ثبت رویداد', errorMessage: 'متاسفانه ثبت رویداد با خطا روبرو شد.', duration: 3);
                      }
                    },
                    maxWidth: Get.width * 0.9,
                    borderRadius: 10,
                    label: 'ثبت',
                    enabled: controller.submitEnabled.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
