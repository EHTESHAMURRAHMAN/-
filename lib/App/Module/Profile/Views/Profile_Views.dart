import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siddique/App/Utils/Common_Color.dart';
import 'package:siddique/App/Utils/CountryList.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final country = 'Select Country'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/logo.png',
                color: CommonColor.primaryColor,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: CommonColor.grid2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/icon.png',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField("Name"),
            const SizedBox(height: 10),
            _buildTextField("Phone"),
            const SizedBox(height: 10),
            _buildTextField("Address"),
            const SizedBox(height: 10),
            _buildTextField("City"),
            const SizedBox(height: 10),
            _buildTextField("ZIP"),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Get.dialog(const CountryList()).then((value) {
                  country.value = value["name"];
                });
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: CommonColor.grid2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Obx(() => Text(country.value)),
                    ),
                    const Icon(Icons.arrow_drop_down, size: 35),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText) {
    return TextFormField(
      //controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: CommonColor.grid2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: CommonColor.grid2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: CommonColor.grid2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: CommonColor.grid2),
        ),
      ),
    );
  }
}
