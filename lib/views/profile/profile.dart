import 'package:flutter/material.dart';
import 'package:health_hive/consts/consts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile'),
      //   backgroundColor: Colors.deepPurple, // Retain color scheme
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4, // Add elevation for MD3 effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Add rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(logo), // Use AssetImage for image
                  ),
                  title: Text(
                    "Username",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    "User@gmail.com",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              itemCount: settingsList.length,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // Handle tap
                    },
                    child: ListTile(
                      leading: Icon(
                        settingsListIcon[index],
                        color: Colors.deepPurple, // Retain color scheme
                      ),
                      title: Text(settingsList[index]),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
