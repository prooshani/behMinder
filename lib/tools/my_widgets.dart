import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:beh_minder/tools/constants.dart';
import 'package:beh_minder/tools/decorations.dart';
import 'package:beh_minder/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ndialog/ndialog.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: Get.context!.isPhone ? 14 : 20),
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
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: Get.context!.isPhone ? 14 : 20),
      ),
      colorText: Colors.black,
      leftBarIndicatorColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration!));
}

Widget myElevatedButton({String? label, double? maxWidth, required Function() onPressed, bool enabled = true}) {
  return GestureDetector(
    onTap: enabled
        ? () {
            onPressed();
          }
        : null,
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
          stops: const [0.2, 1, 0],
          colors: enabled
              ? [
                  Colors.blue.shade400,
                  Colors.blue.shade800,
                  Colors.blue.shade400,
                ]
              : [Colors.blueGrey.shade100, Colors.blueGrey.shade300, Colors.blueGrey.shade100],
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

String jalaliDateTimeNow({
  TextDirection direction = TextDirection.rtl,
}) {
  String jDate = Jalali.now().formatCompactDate();
  String currentHour = DateTime.now().hour < 10 ? '0' + DateTime.now().hour.toString() : DateTime.now().hour.toString();
  String currentMinute = DateTime.now().minute < 10 ? '0' + DateTime.now().minute.toString() : DateTime.now().minute.toString();
  String currentSecond = DateTime.now().second < 10 ? '0' + DateTime.now().second.toString() : DateTime.now().second.toString();

  String jTime = currentHour + ':' + currentMinute + ':' + currentSecond;

  return direction == TextDirection.rtl ? jTime + ' - ' + jDate : jDate + ' - ' + jTime;
}

String jalaliDateNow() {
  String jDate = Jalali.now().formatCompactDate() + '  ' + Jalali.now().formatter.wN;

  return jDate;
}

jalaliDateField(
    {@required TextEditingController? txtController,
    required String? Function(String?) validator,
    bool enabled = true,
    String? labelText,
    hintText,
    double? width,
    double? height,
    bool? isJalali,
    TextDirection? txtDirection,
    double size = 18}) {
  RxString jDate = ''.obs;

  String formatJDate(Date d) {
    final f = d.formatter;

    return '${f.yyyy}/${f.mm}/${f.dd}';
  }

  return SizedBox(
    width: width ?? 150,
    height: height ?? 150,
    child: Directionality(
      textDirection: txtDirection ?? TextDirection.rtl,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        enabled: enabled,
        decoration: kTextFieldEnabledDecoration.copyWith(
          labelText: labelText,
          hintText: hintText,
          suffix: const Icon(
            FontAwesomeIcons.calendar,
          ),
        ),
        textAlign: TextAlign.center,
        autofocus: false,
        readOnly: true,
        style: farsiTextDecorationVazir.copyWith(
            color: darkMode.value ? Colors.white : Colors.black87, fontWeight: FontWeight.w700, fontSize: size),
        enableInteractiveSelection: false,
        controller: txtController,
        onTap: () async {
          DialogBackground(
            color: Colors.transparent,
            blur: 3,
            dialog: NDialog(
              dialogStyle: DialogStyle(
                borderRadius: BorderRadius.circular(20),
                contentPadding: const EdgeInsets.all(10),
              ),
              content: Container(
                decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(20)),
                child: LinearDatePicker(
                  initialDate: txtController!.text,
                  dateChangeListener: (String selectedDate) {
                    txtController.text = selectedDate;
                  },
                  showMonthName: true,
                  isJalaali: isJalali ?? true,
                  showDay: true,
                  showLabels: true,
                  labelStyle: farsiTextDecorationVazir,
                  selectedRowStyle:
                      farsiTextDecorationVazir.copyWith(fontWeight: FontWeight.w600, fontSize: Get.context!.isPhone ? 15 : 22),
                  unselectedRowStyle: farsiTextDecorationVazir.copyWith(
                    color: Colors.white38,
                    fontSize: Get.context!.isPhone ? 10 : 14,
                    fontWeight: FontWeight.w400,
                  ),
                  columnWidth: 100,
                ),
              ),
              actions: [
                Container(
                  color: Colors.lightGreen,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: Text(
                          'تائید',
                          style:
                              farsiTextDecorationVazir.copyWith(color: Colors.white, fontWeight: FontWeight.w700, fontSize: size),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Jalali j = Jalali.now();
                          jDate.value = formatJDate(j);
                          txtController.text = jDate.value;
                          Get.back();
                        },
                        child: Text(
                          'امروز',
                          style:
                              farsiTextDecorationVazir.copyWith(color: Colors.white, fontWeight: FontWeight.w700, fontSize: size),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).show(Get.context!);
        },
      ),
    ),
  );
}

timeField(
    {required TextEditingController txtController,
    required String? Function(String?) validator,
    // GlobalKey<FormState> key,
    bool enabled = true,
    double? width,
    double? height,
    String? label,
    double size = 25}) {
  var maskFormatter = MaskTextInputFormatter(
      mask: '*# : %#', filter: {"#": RegExp(r'[0-9]'), "*": RegExp(r'[0-2]'), "%": RegExp(r'[0-5]')}, initialText: '00:00');
  return SizedBox(
    width: width ?? 100,
    height: height ?? 150,
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: txtController,
      enabled: enabled,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      style: farsiTextDecorationVazir.copyWith(
          color: darkMode.value ? Colors.white : Colors.black87, fontWeight: FontWeight.w700, fontSize: size),
      decoration: kTextFieldDecoration.copyWith(
        hintText: '00 : 00',
        labelText: label,
      ),
      inputFormatters: [maskFormatter],
      keyboardType: TextInputType.number,
    ),
  );
}

Future questionDialog({
  String confirmBtnTxt = 'بله',
  String cancelBtnTxt = 'خیر',
  String? titleTxt,
  DialogType dialogType = DialogType.WARNING,
  Widget? content,
  required void Function() onConfirm,
  required void Function() onCancel,
}) async {
  return await AwesomeDialog(
    dialogBorderRadius: const BorderRadius.all(Radius.circular(15)),
    context: Get.context!,
    width: Get.context!.isPhone ? Get.width * 0.8 : Get.width * 0.6,
    dialogType: dialogType,
    headerAnimationLoop: false,
    padding: EdgeInsets.zero,
    showCloseIcon: false,
    dismissOnTouchOutside: true,
    dismissOnBackKeyPress: true,
    title: titleTxt,
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: content,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: DialogButton(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  radius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topRight: Radius.circular(0)),
                  color: Colors.redAccent,
                  onPressed: () async {
                    onCancel();
                  },
                  child: Text(cancelBtnTxt, style: farsiTextDecorationSahel, textDirection: TextDirection.rtl)),
            ),
            Expanded(
              child: DialogButton(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  radius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      topLeft: Radius.circular(0),
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(0)),
                  color: Colors.lightGreen,
                  onPressed: () async {
                    onConfirm();
                  },
                  child: Text(confirmBtnTxt, style: farsiTextDecorationSahel, textDirection: TextDirection.rtl)),
            ),
          ],
        ),
      ],
    ),
  ).show();
}
