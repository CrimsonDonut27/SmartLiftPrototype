import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,

          title: const Text('what\'s up my NIGGERS'),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Floating Action Button Pressed');
          },
          child: const Icon(Icons.add),
        ) ,



        body: Row(
          mainAxisAlignment: MainAxisAlignment
              .center, //MainAxisAlignment.center, - Spacing between the children along the main axis (vertical in this case).
          crossAxisAlignment: CrossAxisAlignment
              .end, //CrossAxisAlignment.center, - Alignment of the children along the cross axis (horizontal in

          children: const [
            Icon(Icons.bar_chart),
            Icon(Icons.battery_charging_full),
            Icon(Icons.brightness_5),
          ],
        ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

      drawer: Drawer(),
    ),
    );

  }
}
