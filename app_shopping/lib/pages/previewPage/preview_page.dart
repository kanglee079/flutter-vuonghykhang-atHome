import 'package:app_shopping/pages/previewPage/pageView/page_view_one.dart';
import 'package:app_shopping/pages/previewPage/pageView/page_view_three.dart';
import 'package:app_shopping/pages/previewPage/pageView/page_view_two.dart';
import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyPageView> {
  PageController controller = PageController();
  final List<Widget> _list = <Widget>[
    const PreviewPageOne(),
    const PreviewPageTwo(),
    const PreviewPageThree(),
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
