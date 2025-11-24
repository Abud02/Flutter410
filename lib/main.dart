// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_uni_project/masjidList.dart';
import 'masjid.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light ? ThemeData.light() : ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home Page",
            style: TextStyle(
              fontSize: 31,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: Colors.indigo[800],
          actions: [
            IconButton(
              icon: Icon(
                light ? Icons.dark_mode_sharp : Icons.light_mode_sharp,
                size: 36,
                color: Colors.white,
              ),
              onPressed: () => setState(() {
                if (light == true) {
                  light = false;
                } else {
                  light = true;
                }
              }),
            ),
            SizedBox(width: 10),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "This application helps you find Masjids near your area, and follow up with prayer times.",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 17),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    // color: index % 2 == 0 ? Colors.grey[700] : Colors.grey[500],
                    color: index % 2 == 0
                        ? Colors.indigo[500]
                        : Colors.indigo[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: ListTile(
                      minTileHeight: 80,
                      iconColor: Colors.white70,
                      textColor: Colors.white,
                      title: Text(
                        cities[index],
                        style: TextStyle(fontSize: 32),
                      ),
                      leading: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(Icons.mosque_rounded, size: 41),
                      ),
                      trailing: Icon(Icons.arrow_forward_rounded, size: 35),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Masjidlist(
                            title: cities[index],
                            masjids: Masjids[cities[index]],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: cities.length,
            ),
          ],
        ),
      ),
    );
  }
}
