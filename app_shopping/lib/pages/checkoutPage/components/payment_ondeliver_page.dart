import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../apps/route/route_name.dart';
import '../../../provider/cart_provider.dart';
import '../../../widgets/button_custom.dart';

class CashOnDeliverPaymentWidget extends StatelessWidget {
  const CashOnDeliverPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Scaffold(
        body: Text(
          "Cảm ơn quý khách đã xác nhận thông tin đặt hàng, đơn hàng sẽ được giao dưới dạng ship COD !",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ButtonCustom(
              onTap: () {
                context.read<CartProvider>().checkout(context);
                Navigator.pushNamed(
                  context,
                  RouteName.checkoutThanksName,
                );
              },
              backgroundColor: Theme.of(context).cardColor,
              textButton: "MAKE PAYMENT",
              textStyle: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ),
      ),
    );
  }
}
