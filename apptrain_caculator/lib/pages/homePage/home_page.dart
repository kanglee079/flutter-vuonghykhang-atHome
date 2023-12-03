import 'package:apptrain_caculator/apps/provider/number_provider.dart';
import 'package:apptrain_caculator/pages/settingPage/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../apps/widget/input_number.dart';
import '../../apps/widget/operators.dart';
import '../../apps/widget/history.dart';
import '../../apps/widget/ouput_number.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingControllerOne = TextEditingController();
  TextEditingController textEditingControllerTwo = TextEditingController();

  void handleSubmit(String calculate) {
    double value1 = double.parse(textEditingControllerOne.text);
    double value2 = double.parse(textEditingControllerTwo.text);
    double result = 0;

    context
        .read<NumberProvider>()
        .performOperation(value1, value2, result, calculate);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/200w.gif',
                image:
                    'https://images.unsplash.com/photo-1518156677180-95a2893f3e9f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InputNumber(
                            controller: textEditingControllerOne,
                          ),
                        ),
                        Expanded(
                          child: InputNumber(
                            controller: textEditingControllerTwo,
                            title: 'Number Two',
                          ),
                        ),
                      ],
                    ),
                    Operators(size: size, handleSubmit: handleSubmit),
                    OutputNumber(size: size),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    History(size: size)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SettingScreen()));
        },
        child: const Icon(
          Icons.settings,
          size: 35,
        ),
      ),
    );
  }
}
