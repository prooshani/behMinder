import 'package:beh_minder/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

void successSnackBar({
  @required String? successTitle,
  @required String? successMessage,
  @required int? duration,
}) {
  Get.snackbar('', '',
      maxWidth: Get.context!.isPhone ? Get.context!.width * 0.9 : Get.context!.width * 0.6,
      icon: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Icon(
          FontAwesomeIcons.circleCheck,
          size: Get.context!.isPhone ? 30 : 50,
          color: Colors.green,
        ),
      ),
      titleText: Text(successTitle!,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: farsiTextDecorationSahel.copyWith(color: Colors.lightGreen, fontWeight: FontWeight.w800)),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            successMessage!,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: farsiTextDecorationSahel.copyWith(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: Get.context!.isPhone ? 14 : 20),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      colorText: Colors.white,
      leftBarIndicatorColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration!));
}

void failedSnackBar({
  @required String? errorTitle,
  @required String? errorMessage,
  @required int? duration,
}) {
  Get.snackbar('', '',
      maxWidth: Get.context!.isPhone ? Get.context!.width * 0.9 : Get.context!.width * 0.6,
      icon: Icon(
        FontAwesomeIcons.circleExclamation,
        color: Colors.redAccent,
        size: Get.context!.isPhone ? 30 : 50,
      ),
      titleText: Text(errorTitle!,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: farsiTextDecorationSahel.copyWith(color: Colors.red, fontWeight: FontWeight.w800)),
      messageText: Text(
        errorMessage!,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: farsiTextDecorationSahel.copyWith(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: Get.context!.isPhone ? 14 : 20),
      ),
      colorText: Colors.white,
      leftBarIndicatorColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration!));
}

Widget myElevatedButton({String? label, double? maxWidth, required Function() onPressed}) {
  return GestureDetector(
    onTap: () {
      onPressed();
    },
    child: Container(
      width: maxWidth,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.0, 1.0],
          colors: [
            Colors.blue.shade400,
            Colors.blue.shade800,
          ],
        ),
        color: Colors.blueAccent,
      ),
      child: Center(
        child: Text(
          label!,
          style: farsiTextDecorationVazir.copyWith(color: Colors.white),
        ),
      ),
    ),
  );
}
