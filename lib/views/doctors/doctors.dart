import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hive/controllers/dr_info.dart';
import 'package:health_hive/views/appointment_view/appointment_view.dart';

import '../../consts/consts.dart';

class Doctors extends StatefulWidget {
  final String uid;

  const Doctors({Key? key, required this.uid}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  final ProfileCont _profileCont = Get.put(ProfileCont());

  @override
  void initState() {
    super.initState();
    print('UID received: ${widget.uid}');
    _profileCont.DRProfileData(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Obx(() => Text(
          _profileCont.name.value ?? 'Doctor Name',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Obx(() {
        if (_profileCont.name.value == null || _profileCont.name.value.isEmpty) {
          // Show a loading indicator or placeholder if data is not yet available
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(logo),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _profileCont.name.value ?? 'Name not available',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                _profileCont.specialization.value ?? 'Specialization not available',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  buildInfoCard(
                    label: 'Phone Number',
                    value: _profileCont.phoneNumber.value ?? 'Not available',
                    icon: Icons.phone,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(height: 20),
                  buildInfoCard(
                    label: 'Qualification',
                    value: _profileCont.qualification.value ?? 'Not available',
                    icon: Icons.school,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(height: 20),
                  buildInfoCard(
                    label: 'Address',
                    value: _profileCont.address.value ?? 'Not available',
                    icon: Icons.location_on,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(height: 20),
                  buildInfoCard(
                    label: 'Email',
                    value: _profileCont.email.value ?? 'Not available',
                    icon: Icons.email,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(height: 20),
                  buildInfoCard(
                    label: 'Available Days',
                    value: _profileCont.availableDays.value ?? 'Not available',
                    icon: Icons.calendar_today,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(height: 20),
                  buildInfoCard(
                    label: 'Available Time',
                    value: _profileCont.availableTimings.value ?? 'Not available',
                    icon: Icons.access_time,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
          );
        }
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle booking appointment
            Get.to(() => Appointment(
              doctorUid: widget.uid,
              availableDays: _profileCont.availableDays.value ?? 'Not available',
              availableTime: _profileCont.availableTimings.value ?? 'Not available',
            ));
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

  Widget buildInfoCard({required String label, required String value, required IconData icon, required Color color}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
