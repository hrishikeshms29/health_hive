// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// // Define the Doctor model
// class Doctor {
//   final String imageUrl;
//   final String name;
//   final String specialization;
//
//   Doctor({required this.imageUrl, required this.name, required this.specialization});
// }
//
// // Define the controller to fetch doctors from Firestore
// class DoctorController extends GetxController {
//   List<Doctor> doctors = [];
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchDoctors(); // Fetch doctors when the controller is initialized
//   }
//
//   void fetchDoctors(String specialization) async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
//           .collection('doctors')
//           .where('specialization', isEqualTo: specialization) // Filter by specialization
//           .get();
//
//       doctors.clear(); // Clear existing list of doctors
//
//       // Iterate through each document snapshot
//       snapshot.docs.forEach((doc) {
//         // Extract data from the document
//         String imageUrl = doc['imageUrl'] ?? ''; // Update field name as per your Firestore structure
//         String name = doc['name'] ?? ''; // Update field name as per your Firestore structure
//         String specialization = doc['specialization'] ?? ''; // Update field name as per your Firestore structure
//
//         // Create Doctor object and add it to the list
//         doctors.add(Doctor(imageUrl: imageUrl, name: name, specialization: specialization));
//       });
//
//       // Notify listeners that the list has been updated
//       update();
//     } catch (e) {
//       print('Error fetching doctors: $e');
//     }
//   }
// }
