import 'package:app_shopping/provider/cart_provider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../apps/route/route_name.dart';
import '../../widgets/button_custom.dart';
import '../../widgets/items_shopping_cart.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).hintColor),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Text(
                "Checkout",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Icon(
              Icons.search,
              color: Theme.of(context).hintColor,
              size: 30,
            )
          ],
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          var dataItem = value.items.values.toList();
          var subtotal = dataItem.fold(
              0, (sum, item) => sum + (item.price! * item.quantity!.toInt()));
          var tax = subtotal * 0.02;
          var total = subtotal + tax;
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.separated(
                    itemCount: dataItem.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(height: 40, color: Colors.grey);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ItemsShoppingCart(
                        id: dataItem[index].id,
                        image: dataItem[index].image,
                        name: dataItem[index].name,
                        price: dataItem[index].price,
                        quantity: dataItem[index].quantity,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DottedLine(
                        dashColor: Theme.of(context).hintColor,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Subtotal",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          Text(
                            '${NumberFormat('#,###', 'vi_VN').format(subtotal)}đ',
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "TAX (2%)",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          Text(
                            '${NumberFormat('#,###', 'vi_VN').format(tax)}đ',
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          Text(
                            '${NumberFormat('#,###', 'vi_VN').format(total)}đ',
                            style: Theme.of(context).textTheme.displaySmall,
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Theme.of(context).indicatorColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Apply Promotion Code",
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                              ),
                              Text(
                                "2 Promos",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ButtonCustom(
                        onTap: () {
                          if (Provider.of<CartProvider>(context, listen: false)
                              .isCartEmpty()) {
                            Fluttertoast.showToast(
                              msg: "Giỏ hàng trống!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 20.0,
                            );
                            return;
                          }
                          Navigator.pushNamed(
                              context, RouteName.checkoutAddressName);
                        },
                        backgroundColor: Theme.of(context).cardColor,
                        textButton: "CHECKOUT",
                        textStyle: Theme.of(context).textTheme.displayMedium,
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
