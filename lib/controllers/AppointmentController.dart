// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AppointmentController {
//   final CollectionReference appointmentCollection = FirebaseFirestore.instance.collection('appointments');
//
//   Future<void> addAppointment(String doctorUid, String patientName, String message, String phoneNumber, String appointmentDay, String appointmentTime) {
//     return appointmentCollection
//         .doc(doctorUid)
//         .collection('appointments')
//         .doc('$appointmentDay-$appointmentTime')
//         .set({
//       'patientName': patientName,
//       'message': message,
//       'phoneNumber': phoneNumber,
//       'appointmentDay': appointmentDay,
//       'appointmentTime': appointmentTime,
//     });
//   }
//
// }
