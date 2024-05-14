import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../consts/images.dart';
import '../doctors/doctors.dart';
//
// class CategoryDetailsView extends StatefulWidget {
//   const CategoryDetailsView({Key? key});
//
//   @override
//   State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
// }
//
// class _CategoryDetailsViewState extends State<CategoryDetailsView> {
//
//   @override
//   Widget build(BuildContext context) {
//     String categoryName = Get.arguments;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Categories'),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//             mainAxisExtent: 360,
//           ),
//           itemCount: 10,
//           itemBuilder: (BuildContext context, int index) {
//             return GestureDetector(
//               onTap: () {
//                 Get.to(() => const Doctors());
//               },
//               child: Card(
//                 elevation: 6,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: SizedBox(
//                         height: 150, // Adjusted height to fit image
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.vertical(
//                             top: Radius.circular(20),
//                           ),
//                           child: Image.asset(
//                             dricon,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Dr. John Doe',
//                             style: TextStyle(
//                               color: Colors.deepPurple,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 24,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             'Cardiologist',
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: 20,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 Get.to(() => const Doctors());
//                               },
//                               child: Text('View Profile',
//                                 style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 12,
//                               ),),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.deepPurple,
//                                 padding: EdgeInsets.symmetric(
//                                   vertical: 14,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
          //   );
          // },
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() {
//   runApp(MaterialApp(
//     title: 'Your App Title',
//     theme: ThemeData(primaryColor: Colors.deepPurple),
//     home: CategoryDetailsView(categoryName: 'Cardiologist'), // Example category name
//   ));
// }
//
// class CategoryDetailsView extends StatelessWidget {
//   final String categoryName;
//
//   const CategoryDetailsView({Key? key, required this.categoryName}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final DoctorController doctorController = Get.put(DoctorController(categoryName: categoryName));
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Categories'),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Obx(
//               () => GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 16,
//               crossAxisSpacing: 16,
//               mainAxisExtent: 360,
//             ),
//             itemCount: doctorController.doctors.length,
//             itemBuilder: (BuildContext context, int index) {
//               return DoctorCard(doctor: doctorController.doctors[index]);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(
    title: 'Your App Title',
    theme: ThemeData(primaryColor: Colors.deepPurple),
    home: CategoryDetailsView(categoryName: 'Cardiologist'), // Example category name
  ));
}

class CategoryDetailsView extends StatelessWidget {
  final String categoryName;

  const CategoryDetailsView({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DoctorController doctorController = Get.put(DoctorController(categoryName: categoryName));

    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
              () => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: 360,
            ),
            itemCount: doctorController.doctors.length,
            itemBuilder: (BuildContext context, int index) {
              return DoctorCard(doctor: doctorController.doctors[index]);
            },
          ),
        ),
      ),
    );
  }
}
class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle doctor card tap
      },
    child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 150, // Adjusted height to fit image
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Image.asset(
                            dricon,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            doctor.specialization,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 20,
                            ),
                          ),

                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => Doctors(uid: doctor.uid));
                              },
                              child: Text('View Profile',
                                style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                padding: EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      // child: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(20),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.withOpacity(0.5),
      //         spreadRadius: 3,
      //         blurRadius: 7,
      //         offset: Offset(0, 3), // changes position of shadow
      //       ),
      //     ],
      //   ),
      //   child: Card(
      //     elevation: 0, // Set elevation to 0 to remove default card shadow
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(20),
      //       child: Stack(
      //         children: [
      //           Positioned(
      //             child: Image.asset(
      //                       dricon,
      //                       fit: BoxFit.cover,
      //                     ),
      //           ),
      //           Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               gradient: LinearGradient(
      //                 begin: Alignment.topCenter,
      //                 end: Alignment.bottomCenter,
      //                 colors: [
      //                   Colors.transparent,
      //                   Colors.black.withOpacity(0.5),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(16.0),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               children: [
      //                 Text(
      //                   doctor.name,
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 24,
      //                   ),
      //                 ),
      //                 SizedBox(height: 8),
      //                 Text(
      //                   doctor.specialization,
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 20,
      //                   ),
      //                 ),
      //                 SizedBox(height: 8),
      //                 Row(
      //                   children: [
      //                     Icon(
      //                       Icons.phone,
      //                       color: Colors.white,
      //                       size: 20,
      //                     ),
      //                     SizedBox(width: 8),
      //                     Text(
      //                       "12", // Replace with actual phone number
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 16,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}


class DoctorController extends GetxController {
  var doctors = <Doctor>[].obs;
  final String categoryName;

  DoctorController({required this.categoryName});

  @override
  void onInit() {
    super.onInit();
    // Fetch doctors data from Firestore
    fetchDoctors();
  }

  void fetchDoctors() async {
    // Fetch doctors data from Firestore based on specialization
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection('doctors')
        .where('specialization', isEqualTo: categoryName)
        .get();

    // Map query results to Doctor objects
    doctors.assignAll(querySnapshot.docs.map((doc) {
      return Doctor(
        uid: doc.id,
        name: doc['name'],
        specialization: doc['specialization'],
        // Phone_Number: doc['Phone Number'],
      );
    }).toList());
  }
}

class Doctor {
  final String uid;
  final String name;
  final String specialization;
  // final String Phone_Number;

  Doctor({required this.uid, required this.name, required this.specialization});
}