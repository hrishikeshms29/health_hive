import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hive/consts/consts.dart';
// import 'package:health_hive/res/components/custom_textfield.dart';
// import 'package:health_hive/views/login_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// Import other views that you will navigate to.

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Health Hive',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    PlaceholderWidget(Colors.deepPurple[200]!),
    PlaceholderWidget(Colors.deepPurple[300]!),
    PlaceholderWidget(Colors.deepPurple[400]!),
    PlaceholderWidget(Colors.deepPurple[500]!),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Hive'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DoctorSearch());
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple.shade400,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Predictions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[800],
        unselectedItemColor: Colors.deepPurple.shade100, // light purple
        onTap: _onItemTapped,
      ),

    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           const SizedBox(height: 10),
//
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 120,
//                   child: Expanded(
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 7,
//                         itemBuilder: (BuildContext context,int index){
//                           return Container(
//                             decoration: BoxDecoration(
//                                 color: Colors.deepPurple.shade100,
//                                 borderRadius: BorderRadius.circular(12)
//                             ),
//                             padding: const EdgeInsets.all(12),
//                             margin: const EdgeInsets.only(right: 6),
//
//                             // height: 44,
//                             // width: 44,
//                             child: Column(
//                               children: [
//                                 Image.asset(iconList[index],
//                                   width: 50,
//                                   // color: Colors.cyanAccent,
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   iconTitleList[index],
//                                   style: const TextStyle(
//                                     color: Colors.deepPurple,
//                                   ),
//                                 )
//                                 ,
//                               ],
//                             ),
//                           );
//                         }
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Align(
//                     alignment: Alignment.center,
//                     child: Text("Popular Doctors",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     )
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   height: 200,
//                   child: Expanded(
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 4,
//                         itemBuilder: (BuildContext context,int index){
//                           return Container(
//                             decoration: BoxDecoration(
//                                 color: Colors.deepPurple.shade100,
//                                 borderRadius: BorderRadius.circular(22)
//                             ),
//                             padding: EdgeInsets.all(12),
//                             margin: EdgeInsets.only(right: 10),
//
//                             // height: 44,
//                             // width: 44,
//                             child: Column(
//                               children: [
//                                 Image.asset(dricon,
//                                   height: 140,
//                                   width: 100,
//                                   color: Colors.cyan.shade50,
//                                 ),
//                                 SizedBox(height: 5),
//                                 const Text(
//                                   "Famous Dr",
//                                   style: TextStyle(
//                                     color: Colors.deepPurple,
//                                   ),
//                                 )
//                                 ,
//                               ],
//                             ),
//                           );
//                         }
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Align(
//                   alignment: Alignment.centerRight ,
//                   child: TextButton(
//                     onPressed: () {
//                       // Get.to(HomeView());
//                     },
//                     child: const Text(
//                       "View ALL",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//
//
//
//               ],
//
//             ),
//           )
//
//         ],
//       ),
//     );
//   }
// }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      List<IconData> iconDataList = [
                        Icons.remove_red_eye,
                        Icons.people,
                        Icons.nature_people,
                        Icons.sports_baseball,
                        Icons.stacked_line_chart,
                        Icons.hearing,
                        Icons.airline_seat_individual_suite,
                        Icons.favorite,
                      ];

                      List<String> iconTitleList = [
                        'Eyes',
                        'Body',
                        'Nose',
                        'Neck',
                        'Bone',
                        'Ears',
                        'Lungs',
                        'Heart',
                      ];

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(right: 6),
                        child: Column(
                          children: [
                            Icon(
                              iconDataList[index],
                              size: 50,
                              color: Colors.black, // Adjust icon color as needed
                            ),
                            const SizedBox(height: 5),
                            Text(
                              iconTitleList[index],
                              style: const TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Popular Doctors",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context,int index){
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.shade100,
                                borderRadius: BorderRadius.circular(22)
                            ),
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(right: 10),

                            // height: 44,
                            // width: 44,
                            child: Column(
                              children: [
                                Image.asset(dricon,
                                  height: 140,
                                  width: 100,
                                  color: Colors.cyan.shade50,
                                ),
                                SizedBox(height: 5),
                                const Text(
                                  "Famous Dr",
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                  ),
                                )
                                ,
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Get.to(HomeView());
                    },
                    child: const Text(
                      "View ALL",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class DoctorSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "Null");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // You can define your own search results here based on the query.
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // You can define your own search suggestions here based on the query.
    return Container();
  }
}
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Health Hive',
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.deepPurple,
//           brightness: Brightness.light,
//         ),
//       ),
//       home: const HomeView(),
//     );
//   }
// }
//
// class HomeView extends StatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   int _selectedIndex = 0;
//
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text('Home Page, Index 0: Consultation'),
//     Text('Doctor List, Index 1: Doctors'),
//     Text('Disease Prediction, Index 2: Predictions'),
//     Text('Appointments, Index 3: Appointments'),
//     Text('Profile, Index 4: Profile'),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Health Hive'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               showSearch(context: context, delegate: DoctorSearch());
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 10),
//
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 120,
//                     child: Expanded(
//                       child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: 5,
//                           itemBuilder: (BuildContext context,int index){
//                             return Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.purpleAccent,
//                                   borderRadius: BorderRadius.circular(12)
//                               ),
//                               padding: EdgeInsets.all(12),
//                               margin: EdgeInsets.only(right: 6),
//
//                               // height: 44,
//                               // width: 44,
//                               child: Column(
//                                 children: [
//                                   Image.asset(iconList[index],
//                                     width: 50,
//                                     // color: Colors.cyanAccent,
//                                   ),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     iconTitleList[index],
//                                     style: TextStyle(
//                                       color: Colors.lightBlueAccent,
//                                     ),
//                                   )
//                                   ,
//                                 ],
//                               ),
//                             );
//                           }
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Align(
//                       alignment: Alignment.center,
//                       child: Text("Popular Doctors",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     height: 200,
//                     child: Expanded(
//                       child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: 4,
//                           itemBuilder: (BuildContext context,int index){
//                             return Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.purpleAccent,
//                                   borderRadius: BorderRadius.circular(22)
//                               ),
//                               padding: EdgeInsets.all(12),
//                               margin: EdgeInsets.only(right: 10),
//
//                               // height: 44,
//                               // width: 44,
//                               child: Column(
//                                 children: [
//                                   Image.asset(dricon,
//                                     height: 140,
//                                     width: 100,
//                                     color: Colors.cyan.shade50,
//                                   ),
//                                   SizedBox(height: 5),
//                                   const Text(
//                                     "Famous Dr",
//                                     style: TextStyle(
//                                       color: Colors.lightBlue,
//                                     ),
//                                   )
//                                   ,
//                                 ],
//                               ),
//                             );
//                           }
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Align(
//                     alignment: Alignment.centerRight ,
//                     child: TextButton(
//                       onPressed: () {
//                         // Get.to(HomeView());
//                       },
//                       child: const Text(
//                         "View ALL",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   )
//
//                 ],
//
//               ),
//             )
//
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'Doctors',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.medical_services),
//             label: 'Predictions',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Appointments',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.deepPurple[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
//
// class DoctorSearch extends SearchDelegate<String> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//       onPressed: () {
//         close(context,"NUll");
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // You can define your own search results here based on the query.
//     return Container();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // You can define your own search suggestions here based on the query.
//     return Container();
//   }
// }


//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Health Hive',
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.deepPurple,
//           brightness: Brightness.light,
//         ),
//       ),
//       home: const HomeView(),
//     );
//   }
// }
// class HomeView extends StatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Health Hive'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               showSearch(context: context, delegate: DoctorSearch());
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 10),
//
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 120,
//                     child: Expanded(
//                       child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: 6,
//                           itemBuilder: (BuildContext context,int index){
//                             return Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.purpleAccent,
//                                 borderRadius: BorderRadius.circular(12)
//                               ),
//                               padding: EdgeInsets.all(12),
//                               margin: EdgeInsets.only(right: 6),
//
//                               // height: 44,
//                               // width: 44,
//                               child: Column(
//                                 children: [
//                                   Image.asset(iconList[index],
//                                   width: 50,
//                                   // color: Colors.cyanAccent,
//                                   ),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     iconTitleList[index],
//                                     style: TextStyle(
//                                       color: Colors.lightBlueAccent,
//                                     ),
//                                   )
//                                   ,
//                                 ],
//                               ),
//                             );
//                           }
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Align(
//                     alignment: Alignment.center,
//                     child: Text("Popular Doctors",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                     )
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     height: 200,
//                     child: Expanded(
//                       child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: 4,
//                           itemBuilder: (BuildContext context,int index){
//                             return Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.purpleAccent,
//                                   borderRadius: BorderRadius.circular(22)
//                               ),
//                               padding: EdgeInsets.all(12),
//                               margin: EdgeInsets.only(right: 10),
//
//                               // height: 44,
//                               // width: 44,
//                               child: Column(
//                                 children: [
//                                   Image.asset(dricon,
//                                     height: 140,
//                                     width: 100,
//                                     color: Colors.cyan.shade50,
//                                   ),
//                                   SizedBox(height: 5),
//                                   const Text(
//                                     "Famous Dr",
//                                     style: TextStyle(
//                                       color: Colors.lightBlue,
//                                     ),
//                                   )
//                                   ,
//                                 ],
//                               ),
//                             );
//                           }
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Align(
//                     alignment: Alignment.centerRight ,
//                     child: TextButton(
//                       onPressed: () {
//                         // Get.to(HomeView());
//                       },
//                       child: const Text(
//                         "View ALL",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   )
//
//                 ],
//
//               ),
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }
// class DoctorSearch extends SearchDelegate<String> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//       onPressed: () {
//         // close(context, null);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // You can define your own search results here based on the query.
//     return Container();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // You can define your own search suggestions here based on the query.
//     return Container();
//   }
// }




//
// class HomeView extends StatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   int _selectedIndex = 0;
//
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text('Home Page, Index 0: Consultation'),
//     Text('Search Doctors, Index 1: Search'),
//     Text('Appointments, Index 2: Appointments'),
//     Text('Profile, Index 3: Profile'),
//     // Add other pages here
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Health Hive'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Appointments',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//           // Add other navigation items here
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.deepPurple[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// class _HomeViewState extends State<HomeView> {
//   // int _selectedIndex = 0;
//
//   // static const List<Widget> _widgetOptions = <Widget>[
//   //   Text('Home Page, Index 0: Consultation'),
//   //   Text('Search Doctors, Index 1: Search'),
//   //   Text('Appointments, Index 2: Appointments'),
//   //   Text('Profile, Index 3: Profile'),
//   //   // Add other pages here
//   // ];
//
//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     _selectedIndex = index;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Health Hive'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               showSearch(context: context, delegate: DoctorSearch());
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10),
//
//           ListView.builder(
//               scrollDirection: Axis.horizontal,
//
//               itemCount: 6,
//               itemBuilder: (BuildContext context,int index){
//             return Container(
//               margin: EdgeInsets.only(right: 6),
//               color: Colors.purpleAccent,
//             height: 44,
//               width: 44,
//             );
//
//           })
//         ],
//         // child: Center(
//         //   child: _widgetOptions.elementAt(_selectedIndex),
//         // ),
//       ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   items: const <BottomNavigationBarItem>[
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.home),
//       //       label: 'Home',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.search),
//       //       label: 'Search',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.calendar_today),
//       //       label: 'Appointments',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.person),
//       //       label: 'Profile',
//       //     ),
//       //     // Add other navigation items here
//       //   ],
//       //   currentIndex: _selectedIndex,
//       //   selectedItemColor: Colors.deepPurple[800],
//       //   onTap: _onItemTapped,
//       // ),
//     );
//   }
// }
//
// class HomeView extends StatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }
