import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:siddique/App/Module/Credentials/Controllers/Credential_Controller.dart';
import 'package:siddique/App/Module/route/app_pages.dart';
import 'package:siddique/App/Utils/Common_Color.dart';

class RegistrationView extends GetView<CredentialController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      'Register'.tr,
                      style: GoogleFonts.alegreya(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: CommonColor.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(125)),
                      height: 150,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(125),
                        child: RiveAnimation.asset(
                          "assets/login-teddy.riv",
                          fit: BoxFit.fitHeight,
                          stateMachines: const ["Login Machine"],
                          onInit: controller.onRiveInit,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: controller.emailFocusNode,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon:
                            Icon(Icons.person, color: Colors.deepPurple),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        hintText: "Name",
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      onChanged: (value) {
                        controller.numLook.value
                            ?.change(value.length.toDouble());
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: controller.emailFocusNode,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon:
                            Icon(Icons.phone, color: Colors.green.shade800),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.pink.shade800),
                        ),
                        hintText: "Phone",
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      onChanged: (value) {
                        controller.numLook.value
                            ?.change(value.length.toDouble());
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: controller.emailFocusNode,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon:
                            Icon(Icons.email, color: Colors.pink.shade800),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.pink.shade800),
                        ),
                        hintText: "Email",
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      onChanged: (value) {
                        controller.numLook.value
                            ?.change(value.length.toDouble());
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      focusNode: controller.passwordFocusNode,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: Icon(Icons.key, color: Colors.brown),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.brown),
                        ),
                        hintText: "Password",
                      ),
                      obscureText: true,
                      style: Theme.of(context).textTheme.bodyMedium,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  controller.login();
                },
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                        color: CommonColor.primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text('Register'.tr,
                            style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))))),
            const SizedBox(height: 5),
            TextButton(
                onPressed: () {
                  Get.offAndToNamed(Routes.LOGIN);
                },
                child: const Text('i Already have account'))
          ],
        ),
      ),
    );
  }
}
