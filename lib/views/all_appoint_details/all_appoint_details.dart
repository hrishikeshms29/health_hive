import 'package:flutter/material.dart';
import 'package:health_hive/views/call/call.dart';
import '../../res/meet/meet.dart';
import '../Video_meet/video_meet.dart';

class AllAppointDetails extends StatelessWidget {
  final String doctorName;
  final String appointmentDay;
  final String appointmentTime;
  final String message;
  final int randomNumber; // Include randomNumber field

  const AllAppointDetails({
    Key? key,
    required this.doctorName,
    required this.appointmentDay,
    required this.appointmentTime,
    required this.message,
    required this.randomNumber, // Initialize randomNumber field
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
      ),
      body: Card(
        elevation: 2,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppointmentDetail('Doctor Name', doctorName),
              SizedBox(height: 20),
              _buildAppointmentDetail('Appointment Day', appointmentDay),
              SizedBox(height: 20),
              _buildAppointmentDetail('Appointment Time', appointmentTime),
              SizedBox(height: 20),
              _buildAppointmentDetail('Message', message),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            // Handle joining the meeting
            DateTime currentDateTime = DateTime.now();
            DateTime appointmentStartDateTime = _parseTime(appointmentDay, appointmentTime.split(' - ')[0]);
            DateTime appointmentEndDateTime = _parseTime(appointmentDay, appointmentTime.split(' - ')[1]);
            if (currentDateTime.isAfter(appointmentStartDateTime) && currentDateTime.isBefore(appointmentEndDateTime)) {
              // JitsiMeetMethods.createMeeting(roomName: randomNumber.toString() ,isAudioMuted: true,isVideoMuted: true);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JMeet(roomId: randomNumber.toString(), userName: doctorName)
                      // CallPage(callID: "1",userName: doctorName)
                  // VideoMeetingPage(
                  // doctorName: doctorName,
                  // appointmentDay: appointmentDay,
                  // appointmentStartTime: appointmentTime.split(' - ')[0],
                  // appointmentEndTime: appointmentTime.split(' - ')[1],
                  // randomNumber: ,
                // ),
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Error'),
                    content: Text('The appointment time has not arrived yet.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Text('Join Meeting'),
        ),
      ),
    );
  }

  Widget _buildAppointmentDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.deepPurple,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
  DateTime _parseTime(String day, String time) {
    return DateTime.parse('$day $time');
  }
}
