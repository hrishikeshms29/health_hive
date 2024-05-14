// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import '../../controllers/AppointmentController.dart';
//
// class Appointment extends StatefulWidget {
//   final String doctorUid;
//   final String availableDays;
//   final String availableTime;
//   const Appointment({
//     Key? key,
//     required this.doctorUid,
//     required this.availableDays,
//     required this.availableTime,
//   }) : super(key: key);
//
//   @override
//   State<Appointment> createState() => _AppointmentState();
// }
//
// class _AppointmentState extends State<Appointment> {
//   ValueNotifier<CalendarFormat> _calendarFormat = ValueNotifier(CalendarFormat.week);
//   DateTime _focusedDay = DateTime.now();
//   late List<String> _availableDays;
//   late List<String> _availableTimeSlots;
//   String selectedAppointmentDay = '';
//   String selectedAppointmentTime = '';
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _message = '';
//   String _phoneNumber = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _availableDays = widget.availableDays.split(',').map((e) => e.trim()).toList();
//     _availableTimeSlots = getTimeSlots(widget.availableTime);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Book Appointment",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: <Widget>[
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Name'),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your name';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _name = value!;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Message'),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a message';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _message = value!;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Phone Number'),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your phone number';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _phoneNumber = value!;
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               TableCalendar(
//                 firstDay: DateTime.now(), // Set to current date
//                 lastDay: DateTime.now().add(Duration(days: 14)), // Set to two weeks from today
//                 focusedDay: _focusedDay,
//                 selectedDayPredicate: (day) {
//                   return isSameDay(_focusedDay, day);
//                 },
//                 calendarFormat: _calendarFormat.value,
//                 onFormatChanged: (format) {
//                   if (_calendarFormat.value != format) {
//                     // Call `setState()` when updating calendar format
//                     setState(() {
//                       _calendarFormat.value = format;
//                     });
//                   }
//                 },
//                 onPageChanged: (focusedDay) {
//                   // No need to call `setState()` here
//                   _focusedDay = focusedDay;
//                 },
//                 // other properties...
//                 onDaySelected: (selectedDay, focusedDay) {
//                   setState(() {
//                     selectedAppointmentDay = _formatDate(selectedDay); // Store selected day
//                     _focusedDay = focusedDay; // update `_focusedDay` here as well
//                   });
//                   fetchAppointments();
//                 },
//
//                 calendarStyle: CalendarStyle(
//                   isTodayHighlighted: true,
//                   selectedDecoration: BoxDecoration(
//                     color: Colors.deepPurple,
//                     shape: BoxShape.circle,
//                   ),
//                   selectedTextStyle: TextStyle(color: Colors.white),
//                   todayDecoration: BoxDecoration(
//                     color: Colors.transparent,
//                     shape: BoxShape.circle,
//                   ),
//                   todayTextStyle: TextStyle(color: Colors.deepPurple),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Available Time for $selectedAppointmentDay", // Show selected day
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Display available time slots
//               if (_availableDays.contains(DateFormat('EEEE').format(_focusedDay))) ..._buildTimeSlots()
//               else Text(
//                 "No available time slots for this day",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.red,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ElevatedButton(
//           onPressed: () {
//             if (_formKey.currentState!.validate()) {
//               _formKey.currentState!.save();
//               // Handle form submission
//               AppointmentController().addAppointment(widget.doctorUid, _name, _message, _phoneNumber, selectedAppointmentDay, selectedAppointmentTime);
//             }
//           },
//           child: Text(
//             "Book Appointment",
//             style: TextStyle(fontSize: 18, color: Colors.white),
//           ),
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.symmetric(vertical: 16),
//             backgroundColor: Colors.deepPurple,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//         ),
//
//       ),
//     );
//   }
//
//   String _formatDate(DateTime date) {
//     final DateFormat formatter = DateFormat('yyyy-MM-dd');
//     final String formatted = formatter.format(date);
//     return formatted;
//   }
//
//   List<Widget> _buildTimeSlots() {
//     return _availableTimeSlots.map((timeSlot) {
//       final hasAppointment = _appointments.containsKey(timeSlot);
//       return Card(
//         color: hasAppointment ? Colors.red : (selectedAppointmentTime == timeSlot ? Colors.green : Colors.deepPurple),
//         child: ListTile(
//           title: Text(
//             timeSlot,
//             style: TextStyle(color: Colors.white),
//           ),
//           onTap: hasAppointment ? null : () {
//             setState(() {
//               selectedAppointmentTime = timeSlot; // Store selected time slot
//             });
//           },
//         ),
//       );
//     }).toList();
//   }
//
//
//   List<String> getTimeSlots(String availableTime) {
//     List<String> timeSlots = [];
//     List<String> times = availableTime.split('-');
//     DateTime startTime = DateFormat('HH').parse(times[0].trim());
//     DateTime endTime = DateFormat('HH').parse(times[1].trim());
//
//     while (startTime.isBefore(endTime)) {
//       final endTimeSlot = startTime.add(Duration(minutes: 30));
//       timeSlots.add(DateFormat('HH:mm').format(startTime) + ' - ' + DateFormat('HH:mm').format(endTimeSlot));
//       startTime = endTimeSlot;
//     }
//
//     return timeSlots;
//   }
// }
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment extends StatefulWidget {
  final String doctorUid;
  final String availableDays;
  final String availableTime;
  const Appointment({
    Key? key,
    required this.doctorUid,
    required this.availableDays,
    required this.availableTime,
  }) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  ValueNotifier<CalendarFormat> _calendarFormat = ValueNotifier(CalendarFormat.week);
  DateTime _focusedDay = DateTime.now();
  late List<String> _availableDays;
  late List<String> _availableTimeSlots;
  String selectedAppointmentDay = '';
  String selectedAppointmentTime = '';
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _message = '';
  String _phoneNumber = '';
  Map<String, dynamic> _appointments = {};

  @override
  void initState() {
    super.initState();
    _availableDays = widget.availableDays.split(',').map((e) => e.trim()).toList();
    _availableTimeSlots = getTimeSlots(widget.availableTime);
    fetchAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Appointment",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Message'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a message';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _message = value!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _phoneNumber = value!;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TableCalendar(
                firstDay: DateTime.now(), // Set to current date
                lastDay: DateTime.now().add(Duration(days: 14)), // Set to two weeks from today
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_focusedDay, day);
                },
                calendarFormat: _calendarFormat.value,
                onFormatChanged: (format) {
                  if (_calendarFormat.value != format) {
                    // Call `setState()` when updating calendar format
                    setState(() {
                      _calendarFormat.value = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },
                // other properties...
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    selectedAppointmentDay = _formatDate(selectedDay); // Store selected day
                    _focusedDay = focusedDay; // update `_focusedDay` here as well
                  });
                  fetchAppointments();
                },
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: TextStyle(color: Colors.deepPurple),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Available Time for $selectedAppointmentDay", // Show selected day
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              // Display available time slots
              if (_availableDays.contains(DateFormat('EEEE').format(_focusedDay))) ..._buildTimeSlots()
              else Text(
                "No available time slots for this day",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              // Handle form submission
              addAppointment(widget.doctorUid, _name, _message, _phoneNumber, selectedAppointmentDay, selectedAppointmentTime);
            }
          },
          child: Text(
            "Book Appointment",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    return formatted;
  }

  List<Widget> _buildTimeSlots() {
    return _availableTimeSlots.map((timeSlot) {
      final hasAppointment = _appointments.containsKey(timeSlot);
      return Card(
        color: hasAppointment ? Colors.red : (selectedAppointmentTime == timeSlot ? Colors.green : Colors.deepPurple),
        child: ListTile(
          title: Text(
            timeSlot,
            style: TextStyle(color: Colors.white),
          ),
          onTap: hasAppointment ? null : () {
            setState(() {
              selectedAppointmentTime = timeSlot; // Store selected time slot
            });
          },
        ),
      );
    }).toList();
  }

  List<String> getTimeSlots(String availableTime) {
    List<String> timeSlots = [];
    List<String> times = availableTime.split('-');
    DateTime startTime = DateFormat('HH').parse(times[0].trim());
    DateTime endTime = DateFormat('HH').parse(times[1].trim());

    while (startTime.isBefore(endTime)) {
      final endTimeSlot = startTime.add(Duration(minutes: 30));
      timeSlots.add(DateFormat('HH:mm').format(startTime) + ' - ' + DateFormat('HH:mm').format(endTimeSlot));
      startTime = endTimeSlot;
    }

    return timeSlots;
  }

  Future<void> fetchAppointments() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('appointments')
        .doc(widget.doctorUid)
        .collection(selectedAppointmentDay)
        .get();

    setState(() {
      _appointments = {
        for (var doc in snapshot.docs)
          doc.id: true,
      };
    });
  }

  Future<void> addAppointment(String doctorUid, String patientName, String message, String phoneNumber, String appointmentDay, String appointmentTime) {
    // Get the current user's UID
    final patientId = FirebaseAuth.instance.currentUser!.uid;

    // Generate a random 8-digit number
    var random = Random();
    var randomNumber = random.nextInt(90000000) + 10000000; // Generates a random number between 10000000 and 99999999

    // Create a map of appointment details
    Map<String, dynamic> appointmentDetails = {
      'doctorId': doctorUid,
      'patientId': patientId,
      'patientName': patientName,
      'message': message,
      'phoneNumber': phoneNumber,
      'appointmentDay': appointmentDay,
      'appointmentTime': appointmentTime,
      'randomNumber': randomNumber,
    };

    // Add the appointment to the doctor's collection
    FirebaseFirestore.instance
        .collection('appointments')
        .doc(doctorUid)
        .collection(appointmentDay)
        .doc(appointmentTime)
        .set(appointmentDetails);

    // Also add the appointment to the patient's collection
    return FirebaseFirestore.instance
        .collection('allAppointments')
        .doc(patientId)
        .collection(appointmentDay)
        .doc(appointmentTime)
        .set(appointmentDetails);
  }


}
