import 'package:app_shopping/apps/config/const.dart';
import 'package:app_shopping/pages/loginPage/login_page.dart';
import 'package:flutter/material.dart';

class PreviewPageThree extends StatelessWidget {
  const PreviewPageThree({super.key});
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to Tanam!\nGrocery Applications",
                  style: previewPageTitle,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\n incididunt ut labore",
                  style: previewPageDesc,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Center(
                      child: Text(
                    "Start",
                    style: previewPageTitle,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
