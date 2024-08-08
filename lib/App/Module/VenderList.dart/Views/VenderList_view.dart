import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siddique/App/Module/Vender_Details/Views/VenderDetail_View.dart';

class VenderListView extends StatelessWidget {
  final String name;
  final Image image;
  const VenderListView({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios)),
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
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(() => VenderDetailViews(name: name, image: image));
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: image,
                    ),
                    title: Text(name),
                    subtitle: Text('Compressor'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
