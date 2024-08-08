import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siddique/App/Module/Booking/Views/Booking_Views.dart';
import 'package:siddique/App/Module/Dashboard/Controllers/DashBoard__Controller.dart';
import 'package:siddique/App/Module/Home/Views/Home_view.dart';
import 'package:siddique/App/Module/Setting/Views/Setting_view.dart';
import 'package:siddique/App/Utils/Common_Color.dart';

class DashBoardView extends GetView<DashboardController> {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      const HomePageView(),
      BookingView(),
      SettingView(),
    ];
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= controller.maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: controller.notchBottomBarController,
              color: CommonColor.primaryColor,
              showLabel: true,
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              notchColor: const Color(0xffd6add9),
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: false,
              durationInMilliSeconds: 300,
              itemLabelStyle: const TextStyle(fontSize: 10),
              elevation: 1,
              bottomBarItems: [
                BottomBarItem(
                    inActiveItem:
                        const Icon(CupertinoIcons.home, color: Colors.white),
                    activeItem:
                        const Icon(CupertinoIcons.home, color: Colors.white),
                    itemLabelWidget: Text('Home'.tr,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.white))),
                BottomBarItem(
                    inActiveItem:
                        const Icon(Icons.calendar_month, color: Colors.white),
                    activeItem:
                        const Icon(Icons.calendar_month, color: Colors.white),
                    itemLabelWidget: Text('Booking'.tr,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.white))),
                BottomBarItem(
                    inActiveItem:
                        Icon(CupertinoIcons.gear_alt_fill, color: Colors.white),
                    activeItem: const Icon(CupertinoIcons.gear_alt_fill,
                        color: Colors.white),
                    itemLabelWidget: Text('Setting'.tr,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white)))
              ],
              onTap: (index) {
                controller.onTabSelected(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
