import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});
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
                    'https://images.unsplash.com/photo-1696259630326-9cf6be5e96aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1846&q=80',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text("Welcome to Page 2"),
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
