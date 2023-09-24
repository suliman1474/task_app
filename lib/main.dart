// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_app/bindings/binding.dart';
import 'package:task_app/routes.dart';

import 'package:task_app/views/authView.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, c) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Task App",
          initialRoute: '/',
          initialBinding: Binding(),
          getPages: Routes(),
        );
      },
    ),
  );
}
