import 'package:flutter/material.dart';

class All_appoint_details extends StatelessWidget {
  const All_appoint_details({Key? key}) : super(key: key);

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
              _buildStatusIndicator('Canceled'), // Change status here
              SizedBox(height: 20),
              _buildAppointmentDetail('Appointment Day', 'Monday, April 18, 2024'),
              SizedBox(height: 20),
              _buildAppointmentDetail('Appointment Time', '10:00 AM'),
              SizedBox(height: 20),
              _buildAppointmentDetail('Mobile Number', '+1 (123) 456-7890'),
              SizedBox(height: 20),
              _buildAppointmentDetail('Full Name', 'John Doe'),
              SizedBox(height: 20),
              _buildAppointmentDetail(
                'Message',
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              ),
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
          },
          child: Text('Join Meeting'),
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(String status) {
    Color indicatorColor = Colors.green;
    switch (status) {
      case 'Canceled':
        indicatorColor = Colors.red;
        break;
      case 'Upcoming':
        indicatorColor = Colors.orange;
        break;
      case 'Completed':
        indicatorColor = Colors.green;
        break;
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: indicatorColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: indicatorColor,
          fontWeight: FontWeight.bold,
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
      ],
    );
  }
}
