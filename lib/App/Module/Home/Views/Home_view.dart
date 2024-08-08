import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siddique/App/Module/Home/Controllers/home_controller.dart';
import 'package:siddique/App/Module/VenderList.dart/Views/VenderList_view.dart';
import 'package:siddique/App/Utils/Common_Color.dart';

class HomePageView extends GetView<HomeController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            flexibleSpace: SafeArea(
                child: Column(children: [
              const Spacer(),
              Image.asset('assets/images/logo.png',
                  color: Colors.deepPurple.shade400,
                  width: MediaQuery.of(context).size.width / 2)
            ]))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16.0)),
                  child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.search),
                          suffixIcon: Icon(CupertinoIcons.color_filter),
                          hintText: 'Search...'.tr,
                          border: InputBorder.none))),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [CommonColor.grid2, CommonColor.grid1],
                      begin: Alignment.centerRight, // Gradient start point
                      end: Alignment.centerLeft, // Gradient end point
                    ),
                    borderRadius: BorderRadius.circular(40.0)),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your One-Stop Solution'.tr,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Reliable AC Repair, Plumbing, and More.'.tr,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/girl.png',
                      width: 80,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Categories'.tr,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: workList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: departmentcolors[
                                      index % departmentcolors.length],
                                  borderRadius: BorderRadius.circular(25.0)),
                              height: 70,
                              width: 70,
                              child: workList[index].image),
                          Text(workList[index].name.tr)
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Venders'.tr,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: venderList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => VenderListView(
                                  name: venderList[index].name,
                                  image: venderList[index].image));
                            },
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: departmentcolors[
                                        index % departmentcolors.length],
                                    borderRadius: BorderRadius.circular(25.0)),
                                height: 170,
                                width: 170,
                                child: venderList[index].image),
                          ),
                          const SizedBox(height: 5),
                          Text(venderList[index].name.tr)
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
