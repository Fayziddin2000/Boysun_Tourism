import 'package:boysun_tourism/splash_dialog.dart';
import 'package:boysun_tourism/texts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

String? lang;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatefulWidget {
  final Connectivity connectivity;

  const MyApp({super.key, required this.connectivity});

  @override
  State<MyApp> createState() => _MyAppState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(),
      locale: Locale(lang ?? 'uz'),
      navigatorKey: navigatorKey,
      home: SplashDialog(),
    );
  }
}
