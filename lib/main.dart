import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:second_project/service/shared_preference.dart';
import 'package:second_project/view/splash_screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.instance.initStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xff9E87E3)),
        buttonTheme: const ButtonThemeData(buttonColor: Color(0xff9E87E3)),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff9E87E3)),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
