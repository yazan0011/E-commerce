import 'package:e_co/app/modules/splash/splash_view.dart';
import 'package:e_co/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'WinkySans',
        primarySwatch: Colors.brown,
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
