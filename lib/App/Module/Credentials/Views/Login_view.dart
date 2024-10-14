import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:siddique/App/Module/Credentials/Controllers/Credential_Controller.dart';
import 'package:siddique/App/Module/route/app_pages.dart';
import 'package:siddique/App/Utils/Common_Color.dart';

class LoginView extends GetView<CredentialController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 32),
            Image.asset(
              'assets/images/logo.png',
              color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(height: 20),
            const LightingEffectContainer(),
            Expanded(
              child: ListView(children: [
                Text(
                  'Login'.tr,
                  style: GoogleFonts.alegreya(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CommonColor.primaryColor,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 25),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  focusNode: controller.emailFocusNode,
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.deepPurple),
                    ),
                    filled: true,
                    fillColor: Colors.deepPurple.shade100,
                    prefixIcon: Icon(Icons.email, color: Colors.pink.shade800),
                    hintText: "Email",
                    hintStyle: const TextStyle(color: Colors.deepPurple),
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                  onChanged: (value) {},
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  focusNode: controller.passwordFocusNode,
                  controller: controller.passwordController,
                  obscureText: controller.passwordInVisible.value,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.deepPurple.shade100,
                    prefixIcon: const Icon(Icons.key, color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.deepPurple),
                    ),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.deepPurple),
                  ),
                  // obscureText: true,
                  style: Theme.of(context).textTheme.bodyMedium,
                  onChanged: (value) {},
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                )
              ]),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    controller.login();
                  },
                  icon: Obx(() => Visibility(
                        visible: controller.showLoading.value,
                        child: Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(2.0),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        ),
                      )),
                  label: const Text("Log in",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: CommonColor.primaryColor,
                  ),
                )),
            const SizedBox(height: 15),
            Center(
                child: InkWell(
                    onTap: () {
                      Get.offAndToNamed(Routes.REGISTER);
                    },
                    child: RichText(
                        text: TextSpan(
                            text: "Don't have account?",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                            children: [
                          TextSpan(
                              text: " Create now",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold))
                        ])))),
          ],
        ),
      ),
    );
  }
}

class LightingEffectContainer extends StatefulWidget {
  const LightingEffectContainer({super.key});

  @override
  _LightingEffectContainerState createState() =>
      _LightingEffectContainerState();
}

class _LightingEffectContainerState extends State<LightingEffectContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final CredentialController controller = Get.find<CredentialController>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * 3.141592653589793,
                child: Container(
                  height: 210,
                  width: 210,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                      colors: const [
                        Colors.deepPurple,
                        Colors.white,
                        Colors.deepPurple,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                      transform: GradientRotation(
                          2 * 3.141592653589793 * _controller.value),
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            height: 180,
            width: 180,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(125),
              child: RiveAnimation.asset(
                "assets/login-teddy.riv",
                fit: BoxFit.cover,
                stateMachines: const ["Login Machine"],
                onInit: (artboard) {
                  controller.controller = StateMachineController.fromArtboard(
                      artboard, "Login Machine");

                  if (controller.controller == null) return;
                  artboard.addController(controller.controller!);

                  controller.isChecking =
                      controller.controller?.findInput("isChecking");
                  controller.lookAtNumber =
                      controller.controller?.findInput("numLook");
                  controller.isHandsUp =
                      controller.controller?.findInput("isHandsUp");
                  controller.trigFail =
                      controller.controller?.findInput("trigFail");
                  controller.trigSuccess =
                      controller.controller?.findInput("trigSuccess");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
