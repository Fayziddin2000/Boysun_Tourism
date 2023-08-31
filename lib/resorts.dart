import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'images.dart';

class Resorts extends StatefulWidget {
  const Resorts({Key? key}) : super(key: key);

  @override
  State<Resorts> createState() => _ResortsState();
}

class _ResortsState extends State<Resorts> {
  @override
  Widget build(BuildContext context) {
    List<String> list = [omonxona1, omonxona2, omonxona3, omonxona4];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: list
                  .map((e) => Image.asset(
                        e.toString(),
                      ))
                  .toList(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'omonxona'.tr,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
