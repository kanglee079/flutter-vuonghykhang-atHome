import 'package:app_shopping/apps/route/route_name.dart';
import 'package:app_shopping/widgets/appbar_custom.dart';
import 'package:app_shopping/widgets/items_checkbox.dart';
import 'package:app_shopping/widgets/text_form_custom.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_custom.dart';
import '../../widgets/status_checkout.dart';

class CheckoutAddressPage extends StatefulWidget {
  const CheckoutAddressPage({super.key});

  @override
  State<CheckoutAddressPage> createState() => _CheckoutPaymentPageState();
}

class _CheckoutPaymentPageState extends State<CheckoutAddressPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _cityNameController = TextEditingController();
  final TextEditingController _countryNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Checkout",
        actions: <Widget>[
          PopupMenuButton<String>(
            color: Theme.of(context).primaryColor,
            icon: const Icon(Icons.menu),
            onSelected: (String result) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Option 1',
                child: Text('Option 1'),
              ),
              const PopupMenuItem<String>(
                value: 'Option 2',
                child: Text('Option 2'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusCheckout(
                isPayment: false,
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  TextFormCustom(
                    controller: _fullNameController,
                    hintText: "Enter your full name",
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Email Address",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  TextFormCustom(
                    controller: _emailAddressController,
                    hintText: "Enter your email address",
                    iconPrefix: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Phone",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  TextFormCustom(
                    controller: _phoneNumberController,
                    hintText: "Enter your phone number",
                    iconPrefix: Icons.phone,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Address",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  TextFormCustom(
                    controller: _addressController,
                    hintText: "Enter your address",
                    iconPrefix: Icons.location_on,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Zip code",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 10),
                            TextFormCustom(
                              controller: _zipCodeController,
                              hintText: "Enter here",
                              iconPrefix: Icons.location_history,
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
                              "City",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 10),
                            TextFormCustom(
                              controller: _cityNameController,
                              hintText: "Enter here",
                              iconPrefix: Icons.location_city,
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
                      ItemCheckbox(text: "Save shipping address"),
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
            onTap: () {
              Navigator.pushNamed(context, RouteName.checkoutPaymentName);
            },
            backgroundColor: Theme.of(context).cardColor,
            textButton: "NEXT",
            textStyle: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
