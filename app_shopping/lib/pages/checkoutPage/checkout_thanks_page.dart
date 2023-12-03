import 'package:flutter/material.dart';

import '../../widgets/button_custom.dart';
import '../root/root_page.dart';

class CheckoutPageThanks extends StatefulWidget {
  const CheckoutPageThanks({super.key});

  @override
  State<CheckoutPageThanks> createState() => _CheckoutPageThanksState();
}

class _CheckoutPageThanksState extends State<CheckoutPageThanks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Cảm ơn quý khách đã mua hàng :D",
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ButtonCustom(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const RootPage()),
                (Route<dynamic> route) => false,
              );
            },
            backgroundColor: Theme.of(context).cardColor,
            textButton: "BACK TO HOME PAGE",
            textStyle: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
