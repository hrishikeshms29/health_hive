import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../all_appoint_details/all_appoint_details.dart';
// import 'all_appoint_details.dart'; // Import your All_appoint_details page

class PatientAppointments extends StatefulWidget {
  const PatientAppointments({Key? key});

  @override
  State<PatientAppointments> createState() => _PatientAppointmentsState();
}

class _PatientAppointmentsState extends State<PatientAppointments> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Appointments'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          if (_selectedDay != null)
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('allAppointments')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection(DateFormat('yyyy-MM-dd').format(_selectedDay!))
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return Expanded(
                  child: ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      return FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance.collection('doctors').doc(document['doctorId']).get(),
                        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator(); // Show a loading spinner while waiting for data
                          } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}"); // Show error message if something went wrong
                          } else {
                            Map<String, dynamic> doctorData = snapshot.data!.data() as Map<String, dynamic>;
                            // String? patientName = doctorData['patientName'];
                            return Card(
                              elevation: 2,
                              margin: EdgeInsets.all(8),
                              child: ListTile(
                                leading: Icon(Icons.event_available, color: Colors.green),
                                title: Text(
                                  '${doctorData['name']} (${doctorData['specialization']})',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(document['appointmentTime']),
                                trailing: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AllAppointDetails(
                                          doctorName: doctorData['name'],
                                          // patientName: doctorData['patientName'],
                                          appointmentDay: DateFormat('yyyy-MM-dd').format(_selectedDay!),
                                          appointmentTime: document['appointmentTime'],
                                          message: document['message'],
                                          randomNumber: document['randomNumber'], // Pass the randomNumber field
                                          // status: document['status'] ?? 'Upcoming', // Set a default status if not available
                                        ),
                                      ),
                                    );
                                  },

                                  child: Text('More Details'),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }).toList(),
                  ),
                );

              },
            ),
        ],
      ),
    );
  }
}
