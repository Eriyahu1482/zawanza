import 'package:flutter/material.dart';
import 'package:zawanza1/pages/change_password_page.dart';
import 'package:zawanza1/pages/detail_track_page.dart';
import 'package:zawanza1/pages/konfidentional_page.dart';
import 'package:zawanza1/pages/login_page.dart';
import 'package:zawanza1/pages/media_page.dart';
import 'package:zawanza1/pages/menu_page.dart';
import 'package:zawanza1/pages/notification_page.dart';
import 'package:zawanza1/pages/profile_page.dart';
import 'package:zawanza1/pages/redaction_page.dart';
import 'package:zawanza1/pages/registration_page.dart';
import 'package:zawanza1/pages/search_page.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        RegistrationPage.routeName: (context) => const RegistrationPage(),
        MenuPage.routeName: (context) => const MenuPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        MediaPage.routeName: (context) =>  MediaPage(),
        RedactionPage.routeName: (context) =>  RedactionPage(),
        ChangePasswordPage.routeName: (context) =>  ChangePasswordPage(),
        NotificationPage.routeName: (context) =>  NotificationPage(),
        KonfidentionalPage.routeName: (context) =>  KonfidentionalPage(),
        SearchPage.routeName: (context) =>  SearchPage(),
        DetailTrackPage.routeName: (context) =>  DetailTrackPage(),
      },
    );
  }
}