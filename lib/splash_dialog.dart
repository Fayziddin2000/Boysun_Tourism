import 'dart:async';

import 'package:boysun_tourism/main.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_router.dart';
import 'bloc/internet_cubit.dart';
import 'images.dart';

class SplashDialog extends StatefulWidget {
  const SplashDialog({Key? key}) : super(key: key);

  @override
  State<SplashDialog> createState() => _SplashDialogState();
}

class _SplashDialogState extends State<SplashDialog> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(navigatorKey.currentContext!).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BlocProvider<InternetCubit>(
                  create: (context) =>
                      InternetCubit(connectivity: Connectivity()),
                  child: const AppRouter(),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, height: 80, width: 80),
            const Text(
              'Boysun',
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
