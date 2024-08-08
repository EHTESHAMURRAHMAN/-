// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:siddique/App/Utils/Common_Color.dart';

// class BookingView extends StatefulWidget {
//   const BookingView({super.key});

//   @override
//   State<BookingView> createState() => _BookingViewState();
// }

// class _BookingViewState extends State<BookingView> {
//   final List<Slot> bookedSlots = [
//     Slot(
//       dateTime: DateTime.now().add(const Duration(hours: 1)),
//       service: 'Plumber'.tr,
//       bookedBy: 'user1',
//       serviceProviderName: 'John Doe',
//       serviceProviderContact: '+1234567890',
//       estimatedArrival: const Duration(minutes: 50),
//     ),
//     Slot(
//       dateTime: DateTime.now().add(const Duration(hours: 2)),
//       service: 'AC Repair'.tr,
//       bookedBy: 'user1',
//       serviceProviderName: 'Alice Johnson',
//       serviceProviderContact: '+0987654321',
//       estimatedArrival: const Duration(minutes: 30),
//     ),
//     Slot(
//       dateTime: DateTime.now().add(const Duration(hours: 1)),
//       service: 'Plumber'.tr,
//       bookedBy: 'user1',
//       serviceProviderName: 'John Doe',
//       serviceProviderContact: '+1234567890',
//       estimatedArrival: const Duration(minutes: 50),
//     ),
//     Slot(
//       dateTime: DateTime.now().add(const Duration(hours: 2)),
//       service: 'AC Repair'.tr,
//       bookedBy: 'user1',
//       serviceProviderName: 'Alice Johnson',
//       serviceProviderContact: '+0987654321',
//       estimatedArrival: const Duration(minutes: 30),
//     ),
//     Slot(
//       dateTime: DateTime.now().add(const Duration(hours: 1)),
//       service: 'Plumber'.tr,
//       bookedBy: 'user1',
//       serviceProviderName: 'John Doe',
//       serviceProviderContact: '+1234567890',
//       estimatedArrival: const Duration(minutes: 50),
//     ),
//     Slot(
//       dateTime: DateTime.now().add(const Duration(hours: 2)),
//       service: 'AC Repair'.tr,
//       bookedBy: 'user1',
//       serviceProviderName: 'Alice Johnson',
//       serviceProviderContact: '+0987654321',
//       estimatedArrival: const Duration(minutes: 30),
//     ),
//     Slot(
//       dateTime: DateTime.now().add(const Duration(hours: 1)),
//       service: 'Plumber'.tr,
//       bookedBy: 'user1',
//       serviceProviderName: 'John Doe',
//       serviceProviderContact: '+1234567890',
//       estimatedArrival: const Duration(minutes: 50),
//     ),
//     Slot(
//       dateTime: DateTime.now().add(const Duration(hours: 2)),
//       service: 'AC Repair'.tr,
//       bookedBy: 'user1',
//       serviceProviderName: 'Alice Johnson',
//       serviceProviderContact: '+0987654321',
//       estimatedArrival: const Duration(minutes: 30),
//     ),
//     Slot(
//       dateTime: DateTime.now().add(const Duration(hours: 1)),
//       service: 'Plumber'.tr,
//       bookedBy: 'user1',
//       serviceProviderName: 'John Doe',
//       serviceProviderContact: '+1234567890',
//       estimatedArrival: const Duration(minutes: 50),
//     ),
//     Slot(
//       dateTime: DateTime.now().add(const Duration(hours: 2)),
//       service: 'AC Repair'.tr,
//       bookedBy: 'user1',
//       serviceProviderName: 'Alice Johnson',
//       serviceProviderContact: '+0987654321',
//       estimatedArrival: const Duration(minutes: 30),
//     ),
//   ];

//   final String currentUser = 'user1';
//   @override
//   double width = 0;
//   bool myAnimation = false;
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       setState(() {
//         myAnimation = true;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Slot> userBookedSlots =
//         bookedSlots.where((slot) => slot.bookedBy == currentUser).toList();

//     return Scaffold(
//         appBar: AppBar(
//             automaticallyImplyLeading: false,
//             toolbarHeight: 70,
//             flexibleSpace: SafeArea(
//                 child: Column(children: [
//               const Spacer(),
//               Image.asset('assets/images/logo.png',
//                   color: CommonColor.primaryColor,
//                   width: MediaQuery.of(context).size.width / 2)
//             ]))),
//         body: userBookedSlots.isEmpty
//             ? const Center(
//                 child: Text('You have not booked any slots.'),
//               )
//             : ListView.builder(
//                 itemCount: userBookedSlots.length,
//                 itemBuilder: (context, index) {
//                   Slot slot = userBookedSlots[index];
//                   return AnimatedContainer(
//                       foregroundDecoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20)),
//                       duration: Duration(milliseconds: 400 + (index * 250)),
//                       curve: Curves.easeIn,
//                       transform: Matrix4.translationValues(
//                           myAnimation ? 0 : MediaQuery.of(context).size.width,
//                           0,
//                           0),
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 20),
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: CommonColor.grid2),
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       child: Column(
//                           //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(slot.service,
//                                 style: TextStyle(
//                                     color: CommonColor.grid2,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold)),
//                             const SizedBox(height: 8),
//                             Row(children: [
//                               const Icon(Icons.person, color: Colors.blue),
//                               const SizedBox(width: 10),
//                               Text(slot.serviceProviderName,
//                                   style: const TextStyle(fontSize: 16))
//                             ]),
//                             const SizedBox(height: 4),
//                             Row(children: [
//                               const Icon(Icons.call, color: Colors.green),
//                               const SizedBox(width: 10),
//                               Text(slot.serviceProviderContact,
//                                   style: const TextStyle(fontSize: 16))
//                             ]),
//                             const SizedBox(height: 4),
//                             Row(children: [
//                               const Icon(Icons.lock_clock, color: Colors.pink),
//                               const SizedBox(width: 10),
//                               Text(
//                                   'Arrive in ${slot.estimatedArrival.inMinutes} minutes',
//                                   style: const TextStyle(fontSize: 16))
//                             ]),
//                             const SizedBox(height: 4),
//                             Row(children: [
//                               const Icon(Icons.alarm, color: Colors.purple),
//                               const SizedBox(width: 10),
//                               Text(
//                                   '${slot.dateTime.hour}:${slot.dateTime.minute.toString().padLeft(2, '0')}',
//                                   style: const TextStyle(fontSize: 16))
//                             ])
//                           ]));
//                 }));
//   }
// }

// booking_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siddique/App/Module/Booking/Controllers/Booking_Controller.dart';
import 'package:siddique/App/Utils/Common_Color.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    BookingController controller = Get.put(BookingController());
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
              )
            ],
          ),
        ),
      ),
      body: GetBuilder<BookingController>(
        builder: (controller) {
          return controller.userBookedSlots.isEmpty
              ? const Center(
                  child: Text('You have not booked any slots.'),
                )
              : ListView.builder(
                  itemCount: controller.userBookedSlots.length,
                  itemBuilder: (context, index) {
                    Slot slot = controller.userBookedSlots[index];
                    return AnimatedContainer(
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      duration: Duration(milliseconds: 400 + (index * 250)),
                      curve: Curves.easeIn,
                      transform: Matrix4.translationValues(
                        controller.myAnimation
                            ? 0
                            : MediaQuery.of(context).size.width,
                        0,
                        0,
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: CommonColor.grid2),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            slot.service,
                            style: TextStyle(
                              color: CommonColor.grid2,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.person, color: Colors.blue),
                              const SizedBox(width: 10),
                              Text(
                                slot.serviceProviderName,
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.call, color: Colors.green),
                              const SizedBox(width: 10),
                              Text(
                                slot.serviceProviderContact,
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.lock_clock, color: Colors.pink),
                              const SizedBox(width: 10),
                              Text(
                                'Arrive in ${slot.estimatedArrival.inMinutes} minutes',
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.alarm, color: Colors.purple),
                              const SizedBox(width: 10),
                              Text(
                                '${slot.dateTime.hour}:${slot.dateTime.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
