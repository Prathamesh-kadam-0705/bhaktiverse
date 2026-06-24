import 'package:bhakti_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/bindings/initial_binding.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("Firebase Initialized Successfully");

  runApp(const MyApp());
}

class MyApp
    extends StatelessWidget {

  const MyApp({
    super.key,
  });

  @override
  Widget build(
      BuildContext context) {

    return GetMaterialApp(

      debugShowCheckedModeBanner:
      false,

      title: "bhakti_app",

      initialBinding: InitialBinding(),

      getPages: AppPages.pages,

      theme: AppTheme.lightTheme,

      initialRoute: Routes.SPLASH,
    );
  }
}