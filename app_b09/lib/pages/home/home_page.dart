import 'package:app_b09/provider/StreamProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<NumberProvider>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder(
                  initialData: value.number,
                  stream: value.numberStream,
                  builder: (context, snapshot) =>
                      Text(snapshot.data.toString()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        value.handClick();
                      },
                      child: Text(!value.isChange ? "play" : "pause"),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        value.handReset();
                      },
                      child: const Text("Reset"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
