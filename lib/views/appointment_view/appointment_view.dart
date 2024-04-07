import 'package:flutter/material.dart';
import 'package:health_hive/res/components/custom_textfield.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
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
              AppointmentField(
                label: "Select Appointment Day",
                hintText: "Select Date",
                prefixIcon: Icons.calendar_today,
              ),
              SizedBox(height: 20),
              AppointmentField(
                label: "Select Appointment Time",
                hintText: "Select Time",
                prefixIcon: Icons.access_time,
              ),
              SizedBox(height: 20),
              AppointmentField(
                label: "Mobile Number",
                hintText: "Enter Your Mobile Number",
                prefixIcon: Icons.phone,
              ),
              SizedBox(height: 20),
              AppointmentField(
                label: "Full Name",
                hintText: "Enter Your Full Name",
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 20),
              AppointmentField(
                label: "Message",
                hintText: "Enter Your Message",
                prefixIcon: Icons.message,
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle booking appointment
          },
          child: Text(
            "Book Appointment",
            style: TextStyle(fontSize: 18,color: Colors.white),
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
}

class AppointmentField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData prefixIcon;

  const AppointmentField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
        SizedBox(height: 8),
        CustomTextField(
          hint: hintText,
          // Customize text field style here if needed
        ),
      ],
    );
  }
}
