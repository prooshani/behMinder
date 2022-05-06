import 'dart:convert';
import 'dart:io';

import 'package:beh_minder/main.dart';
import 'package:beh_minder/networking/data_model_event.dart';
import 'package:beh_minder/networking/data_model_token.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'data_model_login.dart';

const String apiUri = 'challenge.reval.me';
const String authLogin = 'v1/auth/login';
const String authVerify = 'v1/auth/verify';
const String calendarCreate = 'v1/calendar/create';

///This is the api connection part which uses POST method.

// Request Pin to login to server using POST method.
// It will return a key as a response and also an OTP code to the mobile number we have entered.
//TODO: Although we are validating the phone number and implemented textMask but it need more security checks before submit
Future<String?> requestPin({required String username}) async {
  try {
    var response = await http.post(Uri.https(apiUri, authLogin), body: jsonEncode({"username": username}), headers: {
      'Content-Type': 'application/json',
      'accept': 'application/json',
    });
    var data = response.body;
    //statusCode 200 means OK from server
    if (response.statusCode == 200) {
      //It is much better to have failed statusCodes' descriptions to handle the errors

      return dataModelFromJson(data).key;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

// This is to verify the otp code we got from sms to check the user's credentials.
// We also need to send back the key we got earlier from requestPin.
// It will return a token key that we would use to create events on the server using token bearer method
Future<String?> verifyPin({required String username, required String keyCode, required int pinCode}) async {
  try {
    var response = await http
        .post(Uri.https(apiUri, authVerify), body: jsonEncode({"username": username, "key": keyCode, "otp": pinCode}), headers: {
      'Content-Type': 'application/json',
      'accept': 'application/json',
    });
    var data = response.body;
    //statusCode 200 means OK from server
    if (response.statusCode == 200) {
      //It is much better to have failed statusCodes' descriptions to handle the errors
      return dataModelTokenFromJson(data).token;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

// This is to request create an event on the server.
// it will return submitted event and an auto-generated ID as a successful result.
// The method to authenticate is token bearer over POST request, and we got the token from verifyPin earlier
Future<DataModelEvent?> createEvent(
    {required String eventName, required String eventStart, required String eventEnd, required String token}) async {
  try {
    var response = await http.post(Uri.https(apiUri, calendarCreate),
        body: jsonEncode({"name": eventName, "start": eventStart, "end": eventEnd}),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'accept': 'application/json',
        });
    DataModelEvent eventData = dataModelEventFromJson(response.body);

    //statusCode 200 means OK from server
    if (response.statusCode == 200) {
      //It is much better to have failed statusCodes' descriptions to handle the errors
      // we will return the whole response data so as to store it in the shared preferences for later uses.
      return eventData;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}
