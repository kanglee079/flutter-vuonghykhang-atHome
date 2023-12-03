import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:train_getapi/pages/loginPage/login_page.dart';
import 'package:train_getapi/pages/shopHomePage/shop_state_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        initialData: null,
        builder: (context, snapShot) {
          User? user = snapShot.data;
          if (user?.uid != null) {
            return const ShopStatePage();
          } else {
            return const LoginPage();
          }

          // if (snapShot.data as bool) {
          //   return const HomeMoviePage();
          // } else {
          //   return const LoginPage();
          // }
        });
  }
}
