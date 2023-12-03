import 'package:apptrain_b02/const/const.dart';
import 'package:flutter/material.dart';

class BT02 extends StatelessWidget {
  const BT02({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height / 2.5,
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Align(
                        child: Text(
                          'Welcome ZendVN',
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            setSpaceHeight(size),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('data'),
                  setSpaceHeight(size),
                  Container(
                    width: size.width * 0.5,
                    height: size.height * 0.04,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(214, 190, 181, 181),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  setSpaceHeight(size),
                  const Text(
                    'Ut et tempora.delectus ut vitaeRerum quae omnis recusandae delectus quo.',
                  ),
                  setSpaceHeight(size),
                  const Text(
                    'nisiMolestiae corrupti veniam iusto excepturi id nostrum aspernatur corrupti eum. Molestiae consequuntur temporibus debitis dolores corrupti voluptatem officia perspiciatis. Reiciendis voluptatem aut eum ratione et et iusto autem.',
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  setSpaceHeight(size),
                  const Row(
                    children: [
                      Expanded(
                        child: Align(
                          child: Text(
                            'Aut asnd Bedias',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          child: Text(
                            'Aut asnd Bedias',
                          ),
                        ),
                      ),
                    ],
                  ),
                  setSpaceHeight(size),
                  Container(
                    width: size.width,
                    height: size.height * 0.2,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(90),
                        bottomLeft: Radius.circular(60),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
