import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siddique/App/Module/OnBoardingPage/Controllers/Onboarding_controller.dart';
import 'package:siddique/App/Utils/Common_Color.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Expanded(
                child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.currentIndex.value = index;
                    },
                    children: [
                  OnboardingSlide(
                    imageAsset: 'assets/images/icon.png',
                    title: 'Welcome to Al-Sadiqa'.tr,
                    description:
                        'Discover the best home services near you quickly and easily. Whether you need a quick fix or a major repair, we\'ve got you covered with top-rated professionals ready to help.'
                            .tr,
                  ),
                  OnboardingSlide(
                    imageAsset: 'assets/images/electrician.png',
                    title: 'Diverse Services'.tr,
                    description:
                        'We offer a wide range of services from AC repair to plumbing and electrical work. No matter the issue, our skilled technicians are equipped to handle all your home maintenance needs with expertise and care.'
                            .tr,
                  ),
                  OnboardingSlide(
                      imageAsset: 'assets/images/bestprice.png',
                      title: 'Affordable Prices'.tr,
                      description:
                          'Enjoy high-quality services from certified providers at competitive prices. Our goal is to ensure you receive the best service possible without breaking the bank, all while maintaining the highest standards of professionalism and reliability.'
                              .tr)
                ])),
            Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                      margin: const EdgeInsets.all(4.0),
                      width:
                          controller.currentIndex.value == index ? 12.0 : 8.0,
                      height:
                          controller.currentIndex.value == index ? 12.0 : 8.0,
                      decoration: BoxDecoration(
                          color: controller.currentIndex.value == index
                              ? CommonColor.primaryColor
                              : Colors.grey,
                          shape: BoxShape.circle));
                }))),
            const SizedBox(height: 20),
            Obx(() => controller.currentIndex.value == 0
                ? InkWell(
                    onTap: () {
                      controller.nextPage();
                    },
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            color: CommonColor.primaryColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                            child: Text('Let\'s Start'.tr,
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)))))
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              backgroundColor: CommonColor.primaryColor,
                              radius: 25,
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: controller.previousPage,
                                  icon: const Icon(Icons.arrow_back_ios))),
                          CircleAvatar(
                              backgroundColor: CommonColor.primaryColor,
                              radius: 25,
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: controller.nextPage,
                                  icon: const Icon(Icons.arrow_forward_ios)))
                        ]))),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;

  const OnboardingSlide({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        imageAsset == 'assets/images/icon.png'
            ? Image.asset(
                imageAsset,
                width: MediaQuery.of(context).size.width / 2,
              )
            : Image.asset(
                imageAsset,
              ),
        const SizedBox(height: 16.0),
        Text(
          title,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 13.0),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
