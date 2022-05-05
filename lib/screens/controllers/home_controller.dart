import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:beh_minder/main.dart';
import 'package:beh_minder/services/routes.dart';
import 'package:beh_minder/tools/my_widgets.dart';
import 'package:beh_minder/tools/styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';

class HomeViewController extends GetxController {
  String? selectedValue;

  List<String> menuItems = [
    'رویدادها',
    'رویداد جدید',
    'تنظیمات',
    'خروج',
  ];

  homeMenu() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        value: selectedValue,
        onChanged: (value) {
          MenuItems.onChanged(Get.context!, value as MenuItem);
        },
        icon: const Icon(FontAwesomeIcons.listUl),
        iconSize: 20,
        iconEnabledColor: Colors.black,
        iconDisabledColor: Colors.grey,
        buttonHeight: 50,
        buttonWidth: 50,
        buttonPadding: const EdgeInsets.only(left: 5, right: 5),
        buttonElevation: 0,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownWidth: 150,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black54,
        ),
        dropdownElevation: 0,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(-20, 0),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [events, newEvent, settings];
  static const List<MenuItem> secondItems = [logout];

  static const events = MenuItem(text: 'رویدادها', icon: FontAwesomeIcons.calendarDays);
  static const newEvent = MenuItem(text: 'رویداد جدید', icon: FontAwesomeIcons.calendarPlus);
  static const settings = MenuItem(text: 'تنظیمات', icon: FontAwesomeIcons.gears);
  static const logout = MenuItem(text: 'خروج', icon: FontAwesomeIcons.arrowRightFromBracket);

  static Widget buildItem(MenuItem item) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          Icon(item.icon, color: Colors.white, size: 22),
          const SizedBox(
            width: 10,
          ),
          Text(item.text, style: farsiTextDecorationVazir.copyWith(color: Colors.white)),
        ],
      ),
    );
  }

  static onChanged(BuildContext context, MenuItem item) async {
    switch (item) {
      case MenuItems.events:
        //Do something
        break;
      case MenuItems.settings:
        //Do something
        break;
      case MenuItems.newEvent:
        //Do something
        break;
      case MenuItems.logout:
        //TODO: pop a dialog to ask if the user really wants to log out
        await questionDialog(
            dialogType: DialogType.QUESTION,
            content: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'آیا مایل به خروج هستید؟',
                style: farsiTextDecorationVazir.copyWith(color: Colors.black54, fontWeight: FontWeight.w700),
              ),
            ),
            onConfirm: () {
              userPrefs.setBool('loggedIn', false);
              Get.toNamed(AppRoutes.login);
            },
            onCancel: () => Get.back());

        break;
    }
  }
}
