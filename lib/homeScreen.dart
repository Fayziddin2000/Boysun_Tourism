import 'package:boysun_tourism/about.dart';
import 'package:boysun_tourism/change_lang.dart';
import 'package:boysun_tourism/festival.dart';
import 'package:boysun_tourism/hotels.dart';
import 'package:boysun_tourism/images.dart';
import 'package:boysun_tourism/map.dart';
import 'package:boysun_tourism/resorts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_us.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> title = [
    'aboutmenu',
    'festival',
    'resorts',
    'hotels',
    'Map',
  ];

  String? lang;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Image.asset(
            logo,
            fit: BoxFit.fitHeight,
            height: 70,
          ),
          actionsIconTheme: const IconThemeData(color: Colors.black),
          actions: [
            PopupMenuButton(
              color: Colors.white,
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    title: Text('Change Lang'.tr),
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => const ChangeLang(),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: Text('About Us'.tr),
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => const AboutUs(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: double.infinity,
                  child: Column(
                    children: [
                      items(img1, title[0].tr, 0),
                      items(img2, title[1].tr, 1),
                      items(img3, title[2].tr, 2),
                      items(img4, title[3].tr, 3),
                      items(img5, title[4].tr, 4),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget items(String photo, String title, int index) {
    return Container(
      height: 120,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(photo),
            fit: BoxFit.cover,
            colorFilter:
                const ColorFilter.mode(Colors.black45, BlendMode.darken)),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextButton(
        onPressed: () {
          Widget route;
          if (index == 0) {
            route = About();
          } else if (index == 1) {
            route = Festival();
          } else if (index == 4) {
            route = Map();
          } else if (index == 2) {
            route = Resorts();
          } else {
            route = Hotels();
          }
          showDialog(
            context: context,
            builder: (context) => route,
          );
        },
        child: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 36)),
      ),
    );
  }
}
