import 'package:app_shopping/apps/config/const.dart';
import 'package:flutter/material.dart';

class PreviewPageTwo extends StatelessWidget {
  const PreviewPageTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dLightMainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: dDarkMainColor),
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Tanam!\nGrocery Applications",
                  style: previewPageTitle,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 20),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\n incididunt ut labore",
                  style: previewPageDesc,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.black,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Icon(
                  Icons.keyboard_double_arrow_right,
                  size: 50,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
