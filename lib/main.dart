import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lachule/bases/app_theme.dart';
import 'package:lachule/binding/main_binding.dart';
import 'package:lachule/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      initialRoute: AppPages.INITIAl,
      getPages: AppPages.routes,
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(microseconds: 500),
      initialBinding: MainBinding(),
    );
  }
}
