import 'package:flutter/material.dart';
import 'package:train_getapi/apps/config/const.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../apps/route/route_name.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    'https://images.unsplash.com/photo-1696366620206-31c3b9a9c6fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1970&q=80',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            const Text("Welcome to Page 3"),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteName.loginName);
              },
              child: Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                  color: dDarkMainColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text("Start")),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
