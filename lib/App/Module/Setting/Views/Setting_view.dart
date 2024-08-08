import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siddique/App/Module/Setting/Controllers/Setting_Controller.dart';
import 'package:siddique/App/Utils/Common_Color.dart';

class SettingView extends GetView<SettingController> {
  SettingView({super.key});

  final SettingController controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Text(
          'Setting'.tr,
          style: TextStyle(
              fontSize: 18,
              color: CommonColor.primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: CommonColor.grid2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/icon.png',
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ehtesham'.tr,
                      style: TextStyle(
                          fontSize: 16,
                          color: CommonColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'ehtesham.flutter@gmail.com',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Icon(CupertinoIcons.moon_fill,
                    size: 25, color: Colors.white),
              ),
              title: Text(
                'Dark Mode'.tr,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              trailing: Obx(() {
                return Switch(
                  value: controller.appController.isDarkMode.value,
                  onChanged: (value) {
                    controller.appController.toggleTheme();
                  },
                );
              }),
            ),
            const SizedBox(height: 10),
            Text(
              'Profile'.tr,
              style: TextStyle(
                  fontSize: 15,
                  color: CommonColor.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SettingBox(
                icon: Icons.person,
                onTap: () {},
                title: 'Edit Profile'.tr,
                trilingicon: Icons.arrow_forward_ios,
                iconColor: Colors.amber),
            SettingBox(
              icon: Icons.key,
              onTap: () {},
              title: 'Change Password'.tr,
              trilingicon: Icons.arrow_forward_ios,
              iconColor: Colors.blue,
            ),
            const SizedBox(height: 10),
            Text(
              'Details'.tr,
              style: TextStyle(
                  fontSize: 15,
                  color: CommonColor.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SettingBox(
                icon: Icons.touch_app,
                onTap: () {},
                title: 'Get in touch'.tr,
                trilingicon: Icons.arrow_forward_ios,
                iconColor: Colors.green),
            SettingBox(
                icon: Icons.details_sharp,
                onTap: () {},
                title: 'About us'.tr,
                trilingicon: Icons.arrow_forward_ios,
                iconColor: Colors.purple),
            const SizedBox(height: 10),
            Text(
              'Regional'.tr,
              style: TextStyle(
                  fontSize: 15,
                  color: CommonColor.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SettingBox(
                icon: Icons.language,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            elevation: 5,
                            shadowColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  'Select Language'.tr,
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Divider(),
                                ),
                                const SizedBox(height: 10),
                                ListTile(
                                    title: Obx(() => Text(
                                        controller.appController.language.value,
                                        style:
                                            GoogleFonts.roboto(fontSize: 14))),
                                    onTap: () => controller.updateLocale(
                                        'en'.tr, 'US'.tr, 'English')),
                                ListTile(
                                  title: Text('عربي'.tr,
                                      style: GoogleFonts.roboto(fontSize: 14)),
                                  onTap: () => controller.updateLocale(
                                      'ar'.tr, 'AR'.tr, 'عربي'),
                                ),
                              ],
                            ),
                          ));
                },
                title: controller.appController.language.value.tr,
                trilingicon: Icons.arrow_forward_ios,
                iconColor: Colors.amber),
            SettingBox(
                icon: Icons.exit_to_app_outlined,
                onTap: () {},
                title: 'Logout'.tr,
                trilingicon: Icons.arrow_forward_ios,
                iconColor: Colors.red),
          ],
        ),
      ),
    );
  }
}
