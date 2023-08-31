import 'package:flutter/material.dart';

import 'images.dart';

class NoIntertnet extends StatelessWidget {
  const NoIntertnet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(logo),
            Container(
                margin: EdgeInsets.only(top: 16),
                child: Text('Sizda internet mavjud emas')),
          ],
        ),
      ),
    );
  }
}
