import 'package:beh_minder/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

InputDecoration kTextFieldDecoration = InputDecoration(
  hintStyle: const TextStyle(fontFamily: 'Sahel', color: Colors.black38, fontSize: 18, fontWeight: FontWeight.w500),
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  errorStyle: farsiTextDecorationSahel.copyWith(fontSize: 12),
  border: const OutlineInputBorder(
    gapPadding: 5,
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.purple.shade300, width: 1.0),
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.purple.shade800, width: 2.0),
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
  ),
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
