import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});
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
                    'https://images.unsplash.com/photo-1695206598174-46c01c47c9e7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1976&q=80',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text("Welcome to Page 1"),
            SizedBox(height: 10),
            Icon(
              Icons.arrow_right_alt_sharp,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
