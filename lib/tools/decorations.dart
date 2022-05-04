import 'package:beh_minder/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

InputDecoration kTextFieldDecoration = const InputDecoration(
  hintStyle: TextStyle(fontFamily: 'Sahel', color: Colors.white54, fontSize: 15, fontWeight: FontWeight.w500),
  errorStyle: TextStyle(fontFamily: 'Sahel', color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
);

InputDecoration kTextFieldEnabledDecoration = InputDecoration(
  fillColor: Colors.transparent,
  labelStyle: const TextStyle(
    color: Color(0xFF4E4D20),
    fontSize: 17,
  ),
  filled: true,
  hintText: '',
  hintStyle: farsiTextDecorationSahel,
  contentPadding: const EdgeInsets.fromLTRB(
    15,
    25,
    25,
    15,
  ),
  errorStyle: farsiTextDecorationSahel.copyWith(fontSize: 12),
  border: const OutlineInputBorder(
    gapPadding: 5,
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  focusedBorder: const OutlineInputBorder(
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
