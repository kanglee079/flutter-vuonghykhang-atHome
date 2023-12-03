// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_shopping/services/firebase_service.dart';
import 'package:flutter/material.dart';

import 'items_of_order.dart';

class ItemsOrder extends StatelessWidget {
  String id;
  ItemsOrder({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).focusColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order ID $id",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "12 Items",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.circle,
                    color: Theme.of(context).hintColor,
                    size: 10,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "On Deliver",
                    style: Theme.of(context).textTheme.displayLarge,
                  )
                ],
              )
            ],
          )
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FutureBuilder(
            future: FirebaseService.ordersRef.doc(id).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData) {
                return const Text('không có data');
              }

              final productData = snapshot.data!.data()!.products;

              if (productData.isEmpty) {
                return const Text('không tìm thấy data');
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productData.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 10, color: Colors.grey);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: itemOfOrder(
                      name: productData[index].productName ?? "",
                      image: productData[index].productImage ?? "",
                      price: productData[index].price ?? 4444,
                      quanity: productData[index].quantity ?? 4444,
                    ),
                  );
                },
              );
            },
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("Xem trạng thái đơn hàng"),
        ),
      ],
    );
  }
}
