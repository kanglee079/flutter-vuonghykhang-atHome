import 'package:flutter/material.dart';

import '../../../widgets/button_custom.dart';
import '../../../widgets/items_checkbox.dart';
import '../../../widgets/text_form_custom.dart';

class CreditCardPaymentWidget extends StatefulWidget {
  const CreditCardPaymentWidget({super.key});

  @override
  State<CreditCardPaymentWidget> createState() =>
      _CreditCardPaymentWidgetState();
}

class _CreditCardPaymentWidgetState extends State<CreditCardPaymentWidget> {
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _monthYearController = TextEditingController();
  final TextEditingController _cvvNumberController = TextEditingController();
  final TextEditingController _countryNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  TextFormCustom(
                    controller: _cardHolderNameController,
                    hintText: "Enter your full name",
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Card Number",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  TextFormCustom(
                    controller: _cardNumberController,
                    hintText: "Enter your card number",
                    iconPrefix: Icons.credit_card,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Month/Year",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 10),
                            TextFormCustom(
                              controller: _monthYearController,
                              hintText: "Enter here",
                              iconPrefix: Icons.timelapse_outlined,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CVV",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 10),
                            TextFormCustom(
                              controller: _cvvNumberController,
                              hintText: "Enter here",
                              iconPrefix: Icons.password,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Country",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  TextFormCustom(
                    controller: _countryNameController,
                    hintText: "Enter your address",
                    iconPrefix: Icons.my_location_sharp,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      ItemCheckbox(text: "Save this card"),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ButtonCustom(
            onTap: () {},
            backgroundColor: Theme.of(context).cardColor,
            textButton: "MAKE PAYMENT",
            textStyle: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
