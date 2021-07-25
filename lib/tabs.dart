import 'package:assignment/login.dart';
import 'package:assignment/post.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';
import 'home.dart';


class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> logoutUser() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs?.clear();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login()),
            (Route<dynamic> route) => false,
      );
    }
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xff1024ED),

          drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff1024ED),
                ),
                child: Text(''),
              ),
              ListTile(
                title: const Text('DashBoard'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashBoard()),
                  );
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: logoutUser,
              ),
            ],
          ),
        ),
          appBar: AppBar(
            backgroundColor:Color(0xff1024ED) ,
            bottom: const TabBar(
              tabs: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Photos'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Post'),
                ),

              ],
            ),

          ),
          body: const TabBarView(
            children: [
              Home(),
              Posts(),
              // Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}