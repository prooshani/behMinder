import 'package:beh_minder/networking/api_networking.dart';
import 'package:beh_minder/networking/data_model_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

//This is new event's page controller which would keep variables, functions and controllers of the new event's view

class NewEventViewController extends GetxController {
  RxBool submitEnabled = false.obs; // This is to control the submit event's button state (enabled/disabled)

  TextEditingController eventName = TextEditingController(); // The textController for even's name field
  String? eventStart; // event start time in ISO8610 string format
  String? eventEnd; // calculated end time of the event in ISO8610 string format

  RxInt eventHour = 0.obs; // hour selector variable (getter/setter)
  RxInt eventMinute = 0.obs; //minute selector variable (getter/setter)
  RxInt eventDuration = 0.obs; //event duration variable (getter/setter)

  // this function will be called upon the user taps the submit event button
  // This will call an api_networking function (createCalendar) respectively
  // Upon successful event submission, it will return the event's store data
  Future submitNewEvent({String? eventName, String? eventStart, String? eventEnd, String? token}) async {
    try {
      DataModelEvent? eventData =
          await createEvent(eventName: eventName!, eventStart: eventStart!, eventEnd: eventEnd!, token: token!);

      return eventData;
    } catch (e) {
      print(e);
    }
  }

  //This function will convert the selected event's start time and also
  // to calculate end time both in ISO8610 UTC String format
  convertEventTime({int? eventHour, int? eventMinute, int? eventDuration}) {
    String today = DateTime.now().toUtc().toString().substring(0, 10);
    String hour = eventHour! < 10 ? '0' + eventHour.toString() : eventHour.toString();
    String minute = eventMinute! < 10 ? '0' + eventMinute.toString() : eventMinute.toString();
    eventStart = today + 'T' + hour + ':' + minute.toString() + ':00.00Z';
    eventEnd = DateTime.tryParse(eventStart!)?.add(Duration(minutes: eventDuration!)).toIso8601String();
  }
}
