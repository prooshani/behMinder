import 'dart:convert';
import 'dart:io';

import 'package:beh_minder/networking/data_model_token.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'data_model_login.dart';

const String authUri = 'https://challenge.reval.me/v1/auth/login';

Future<String?> requestPin({required String username}) async {
  try {
    var response =
        await http.post(Uri.https('challenge.reval.me', 'v1/auth/login'), body: jsonEncode({"username": username}), headers: {
      'Content-Type': 'application/json',
      'accept': 'application/json',
    });
    var data = response.body;
    print(response.statusCode);
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

Future<String?> verifyPin({required String username, required String keyCode, required int pinCode}) async {
  try {
    var response = await http.post(Uri.https('challenge.reval.me', 'v1/auth/verify'),
        body: jsonEncode({"username": username, "key": keyCode, "otp": pinCode}),
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
        });
    var data = response.body;
    print(response.statusCode);

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
