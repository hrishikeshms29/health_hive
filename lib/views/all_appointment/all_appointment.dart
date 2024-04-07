import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_hive/views/all_appoint_details/all_appoint_details.dart';

class All_Appoint extends StatefulWidget {
  const All_Appoint({Key? key});

  @override
  State<All_Appoint> createState() => _All_AppointState();
}

class _All_AppointState extends State<All_Appoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Appointments'),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'), // Replace with your logo asset path
                ),
                title: Text(
                  'Doctor Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Time'),
                trailing: GestureDetector(
                  onTap: () {
                    Get.to(() => All_appoint_details());
                    // Navigate to All_appoint_details page
                     // Assuming All_appoint_details is a StatefulWidget

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple, // Change the color as needed
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'View Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
