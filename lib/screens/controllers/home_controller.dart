import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:beh_minder/main.dart';
import 'package:beh_minder/services/routes.dart';
import 'package:beh_minder/tools/my_widgets.dart';
import 'package:beh_minder/tools/styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

// This is home controller which extends GetX controller view and will hold variables and controllers we are using in our
// homePage (Appointments calendar view)

class HomeViewController extends GetxController {
  String? selectedValue; // keep selected menu item the user have been selected

  RxInt selectedIndex = 0.obs; // used to keep calendar section the user have been tapped in calendar timeline view

  Rx<ScrollController?> fieldListScroller = ScrollController().obs; // scrollController for timelineField (left side)
  Rx<ScrollController?> timeListScroller = ScrollController().obs; //ScrolController for time numbers (right side)
  Rx<LinkedScrollControllerGroup?> scrollControllers = LinkedScrollControllerGroup().obs; // to sync the scroll of left and
  // right panels of timeline

  @override
  void onInit() async {
    //method to add scroller controllers to synced one to use as a single controller for the timeline
    fieldListScroller.value = scrollControllers.value?.addAndGet();
    timeListScroller.value = scrollControllers.value?.addAndGet();
//TODO: Scroll to current time here
    super.onInit();
  }

// Here is the menu Widget for topRight menu in the home view

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
          //here we can split menu items into 2 groups for better user experience
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

// A class to generate homeMenu's Items
class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

// Create ListItems for the homeMenu Items' list
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

  // When the user select an item from the homeMenu list, this function would call to take care of that.
  static onChanged(BuildContext context, MenuItem item) async {
    switch (item) {
      case MenuItems.events:
        //TODO: open a list of events here
        break;
      case MenuItems.settings:
        //TODO: app settings like dark mode & ... here
        break;
      case MenuItems.newEvent:
        //TODO: call for new event page here
        break;
      case MenuItems.logout:
        //Tpop a dialog to ask if the user really wants to log out or it is happened unintended
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
