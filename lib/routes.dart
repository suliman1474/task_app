// ignore_for_file: prefer_const_constructors

import 'package:task_app/views/authView.dart';
import 'package:task_app/views/home_screen.dart';
import 'package:task_app/views/login_screen.dart';
import 'package:task_app/views/signup_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:task_app/views/update_screen.dart';

Routes() => [
      GetPage(
        name: '/',
        page: () => AuthView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 600),
      ),
      GetPage(
        name: '/home',
        page: () => HomeScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 600),
      ),
      GetPage(
        name: '/login-screen',
        page: () => LoginScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 600),
      ),
      GetPage(
        name: '/signup-screen',
        page: () => SignupScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 600),
      ),
      GetPage(
        name: '/update',
        page: () => UpdateScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 600),
      ),
    ];
