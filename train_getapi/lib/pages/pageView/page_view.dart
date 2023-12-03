import 'package:flutter/material.dart';
import 'package:train_getapi/pages/pageView/loginPageWidget/page_one.dart';
import 'package:train_getapi/pages/pageView/loginPageWidget/page_three.dart';

import 'loginPageWidget/page_two.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  _MyHomeMoviePageState createState() => _MyHomeMoviePageState();
}

class _MyHomeMoviePageState extends State<MyPageView> {
  PageController controller = PageController();
  final List<Widget> _list = <Widget>[
    const PageOne(),
    const PageTwo(),
    const PageThree(),
  ];
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (num) {
          setState(() {
            _curr = num;
          });
        },
        children: _list,
      ),
    );
  }
}
