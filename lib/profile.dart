// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: Colors.amber,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: Container(
              margin: EdgeInsets.only(
                      bottom: 20, left: MediaQuery.sizeOf(context).width) /
                  5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    maxRadius: 40,
                    minRadius: 20,
                    backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/en/b/bd/Doraemon_character.png',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [Text("Doraemon"), Text("User")],
                  )
                ],
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("About"),
                      Icon(Icons.info),
                    ],
                  ),
                )),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Edit Profile"),
                      Icon(Icons.edit),
                    ],
                  ),
                )),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Settings"),
                      Icon(Icons.settings),
                    ],
                  ),
                )),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Report"),
                      Icon(Icons.report),
                    ],
                  ),
                )),
            ElevatedButton(
                onPressed: () {},
                child: Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Log out"),
                      Icon(Icons.logout),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
