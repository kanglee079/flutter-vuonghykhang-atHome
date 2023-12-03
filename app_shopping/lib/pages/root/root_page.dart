import 'package:app_shopping/apps/models/info.dart';
import 'package:app_shopping/pages/shop_state_page.dart';
import 'package:app_shopping/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../loginPage/login_page.dart';

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
          return StreamProvider<Info?>.value(
            value:
                FirebaseService.infoRef.doc(user?.uid).snapshots().map((event) {
              return event.data();
            }),
            initialData: null,
            builder: (context, child) {
              return const ShopStatePage();
            },
          );
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
