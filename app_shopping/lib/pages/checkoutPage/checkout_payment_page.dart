import 'package:flutter/material.dart';

import '../../widgets/status_checkout.dart';
import 'components/payment_credit_page.dart';
import 'components/payment_ondeliver_page.dart';
import 'components/payment_paypal_page.dart';

class CheckoutPaymentPage extends StatefulWidget {
  const CheckoutPaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<CheckoutPaymentPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Payment",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          StatusCheckout(
            isPayment: true,
          ),
          const SizedBox(height: 15),
          TabBar(
            labelColor: Theme.of(context).cardColor,
            labelStyle: TextStyle(
              color: Theme.of(context).cardColor,
              fontWeight: FontWeight.w700,
            ),
            controller: _tabController,
            tabs: const [
              Tab(text: 'Credit Card'),
              Tab(text: 'PayPal'),
              Tab(text: 'Cash On Deliver'),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                CreditCardPaymentWidget(),
                PayPalPaymentWidget(),
                CashOnDeliverPaymentWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
