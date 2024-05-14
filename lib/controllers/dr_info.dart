import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileCont extends GetxController {
  // User? user = FirebaseAuth.instance.currentUser;

  final CollectionReference doctors =
  FirebaseFirestore.instance.collection('doctors');

  RxString name = ''.obs;
  RxString id = ''.obs;
  RxString email = ''.obs;
  RxString qualification = ''.obs;
  RxString specialization = ''.obs;
  RxString address = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString about = ''.obs;
  RxString availableDays = ''.obs;
  RxString availableTimings = ''.obs;
  RxString workplace = ''.obs;
  RxString superSpeciality = ''.obs;

  // Function to fetch doctor's profile data from Firebase
  Future<void> DRProfileData(String UID) async {
    try {
        // String uid = UID;
        DocumentSnapshot<Object?> snapshot =
        await doctors.doc(UID).get();

        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          name.value = data["name"] ?? '';
          print('Name: ${name.value}');
          id.value = data['Rid'] ?? '';
          print('ID: ${id.value}');
          email.value = data['Email'] ?? '';
          print('Email: ${email.value}');
          qualification.value = data['qualification'] ?? '';
          print('Qualification: ${qualification.value}');
          specialization.value = data['specialization'] ?? '';
          print('Specialization: ${specialization.value}');
          address.value = data['address'] ?? '';
          print('Address: ${address.value}');
          phoneNumber.value = data['phoneNumber'] ?? '';
          print('Phone Number: ${phoneNumber.value}');
          about.value = data['about'] ?? '';
          print('About: ${about.value}');
          availableDays.value = data['availableDays'] ?? '';
          print('Available Days: ${availableDays.value}');
          availableTimings.value = data['availableTimings'] ?? '';
          print('Available Timings: ${availableTimings.value}');
          workplace.value = data['workplace'] ?? '';
          print('Workplace: ${workplace.value}');
          superSpeciality.value = data['superSpeciality'] ?? '';
          print('Super Speciality: ${superSpeciality.value}');
        }
    } catch (e) {
      print('Error fetching profile data: $e');
    }
  }
}
