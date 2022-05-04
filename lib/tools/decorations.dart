import 'package:beh_minder/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(fontFamily: 'Sahel', color: Colors.white54, fontSize: 15, fontWeight: FontWeight.w500),
  errorStyle: TextStyle(fontFamily: 'Sahel', color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
);

const kTextFieldEnabledDecoration = InputDecoration(
  fillColor: Colors.transparent,
  labelStyle: TextStyle(
    color: Color(0xFF4E4D20),
    fontSize: 17,
  ),
  filled: true,
  hintText: '',
  hintStyle: farsiTextDecorationSahel,
  contentPadding: EdgeInsets.fromLTRB(
    15,
    25,
    25,
    15,
  ),
  errorStyle: TextStyle(
    color: Colors.redAccent,
    fontSize: 10,
  ),
  border: OutlineInputBorder(
    gapPadding: 5,
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
);

var mobileMaskFormatter = MaskTextInputFormatter(
    mask: '#@%% %%% %%%%',
    filter: {
      "#": RegExp(r'[0]', unicode: true),
      "@": RegExp(r'[9]', unicode: true),
      "%": RegExp(r'[0-9]', unicode: true),
    },
    initialText: '۰۹۳۶ ۳۴۵ ۶۷۸۹');
