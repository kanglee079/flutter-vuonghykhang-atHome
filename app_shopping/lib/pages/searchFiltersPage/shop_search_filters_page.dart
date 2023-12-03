import 'package:app_shopping/widgets/items_personal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/button_custom.dart';
import '../../widgets/items_checkbox.dart';
import '../../widgets/text_form_custom.dart';

class SearchFiltersPage extends StatefulWidget {
  const SearchFiltersPage({super.key});

  @override
  State<SearchFiltersPage> createState() => _SearchFiltersPageState();
}

class _SearchFiltersPageState extends State<SearchFiltersPage> {
  double _userRating = 3.0;
  @override
  Widget build(BuildContext context) {
    final TextEditingController minPriceController = TextEditingController();
    final TextEditingController maxPriceController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 35,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Search Filtters",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Reset",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Price Range",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: TextFormCustom(
                        controller: minPriceController,
                        hintText: "Min",
                        iconPrefix: FontAwesomeIcons.dollarSign,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormCustom(
                        controller: maxPriceController,
                        hintText: "Max",
                        iconPrefix: FontAwesomeIcons.dollarSign,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(height: 15),
                Text(
                  "Star Rating",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(child: StatefulBuilder(
                      builder: (context, setState) {
                        return RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.only(right: 5),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _userRating = rating;
                            });
                          },
                        );
                      },
                    )),
                    Text(
                      "$_userRating Star",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(height: 15),
                Text(
                  "Others",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: ItemCheckbox(
                        text: "Discount",
                      ),
                    ),
                    Expanded(
                      child: ItemCheckbox(
                        text: "Voucher",
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ItemCheckbox(
                        text: "Free Shipping",
                      ),
                    ),
                    Expanded(
                      child: ItemCheckbox(
                        text: "Same Day Deliver",
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(height: 15),
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    ItemsPersonal(
                      icon: FontAwesomeIcons.lemon,
                      colorIcon: Theme.of(context).cardColor,
                      nameItem: "Fresh Fruits",
                    ),
                    ItemsPersonal(
                      icon: FontAwesomeIcons.carrot,
                      colorIcon: Theme.of(context).cardColor,
                      nameItem: "Fresh Vegetables",
                    ),
                    ItemsPersonal(
                      icon: FontAwesomeIcons.pizzaSlice,
                      colorIcon: Theme.of(context).cardColor,
                      nameItem: "Fast Food",
                    ),
                    ItemsPersonal(
                      icon: Icons.bakery_dining_outlined,
                      colorIcon: Theme.of(context).cardColor,
                      nameItem: "Bakery",
                    ),
                    ItemsPersonal(
                      icon: FontAwesomeIcons.fish,
                      colorIcon: Theme.of(context).cardColor,
                      nameItem: "Sea Food",
                    ),
                    ItemsPersonal(
                      icon: FontAwesomeIcons.lemon,
                      colorIcon: Theme.of(context).cardColor,
                      nameItem: "Fresh Fruits",
                    ),
                    ItemsPersonal(
                      icon: FontAwesomeIcons.lemon,
                      colorIcon: Theme.of(context).cardColor,
                      nameItem: "Fresh Fruits",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ButtonCustom(
            onTap: () {},
            backgroundColor: Theme.of(context).cardColor,
            textButton: "APPLY FILTER",
            textStyle: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
