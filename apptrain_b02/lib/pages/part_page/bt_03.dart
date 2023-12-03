import 'package:apptrain_b02/const/const.dart';
import 'package:flutter/material.dart';

class BT03 extends StatelessWidget {
  const BT03({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
              vertical: size.width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Training',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                setSpaceHeight(size),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Repudiandae est cu',
                      ),
                    ),
                    const Text(
                      'Detail',
                      style: TextStyle(color: Colors.amber, fontSize: 16),
                    ),
                    setSpaceWeight(size),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
                setSpaceHeight(size),
                Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.2,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(size.width * 0.03),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('data'),
                            Expanded(child: Text('data')),
                            Row(
                              children: [
                                Text('Data'),
                                Expanded(
                                  child: Text('Data'),
                                ),
                                Text('Data'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    setSpaceHeight(size),
                    Container(
                      width: size.width,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                setSpaceHeight(size),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'data',
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.7 / 2,
                      ),
                      children: List.generate(
                        10,
                        (index) => Container(
                          padding: EdgeInsets.all(size.width * 0.07),
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
