import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siddique/App/Module/Vender_Details/Controllers/Vender_Details_Controller.dart';

class VenderDetailViews extends StatelessWidget {
  final String name;
  final Image image;

  const VenderDetailViews({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VenderDetailController>(
      init: VenderDetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(name),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                ScaleTransition(
                  scale: controller.scaleAnimation,
                  child: FadeTransition(
                    opacity: controller.fadeAnimation,
                    child: RotationTransition(
                      turns: controller.rotationAnimation,
                      child: image,
                    ),
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'fbiffoxifgofi4bfnwfcbiwfweofcfgwegfouewgfuyewgfgweofeygfwefgeggegfgegegfggfgfiwgfgefegfwgfiywgifgiyfwgiyfiygfweiyfgiwyegfwggwfiyeygeggfgfygweigfiwgggfweiyfwgeiyfegiyf',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
