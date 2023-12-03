import 'package:card_swiper/card_swiper.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:train_getapi/widgets/button_custom.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  _ProductDetailPage createState() => _ProductDetailPage();
}

class _ProductDetailPage extends State<ProductDetailPage> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        child: Image.network(
                          "https://via.placeholder.com/288x188",
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    itemCount: 4,
                    pagination: const SwiperPagination(),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Theme.of(context).primaryColor),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Expanded(child: SizedBox(width: 1)),
                      IconButton(
                        icon: Icon(Icons.favorite_border,
                            color: Theme.of(context).primaryColor),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert,
                            color: Theme.of(context).primaryColor),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "FRUITS",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Organic Lemons",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow.shade800),
                            const SizedBox(width: 5),
                            Text(
                              "4.6 (89 reviews)",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const Spacer(),
                            const Icon(Icons.local_shipping,
                                color: Colors.green),
                            const SizedBox(width: 5),
                            Text(
                              "FREE DELIVERY",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Price",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          children: [
                            Text("\$5.8",
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text("\$8.0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    setState(
                                      () {
                                        if (quantity > 1) quantity--;
                                      },
                                    );
                                  },
                                ),
                                Text(quantity.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(
                                      () {
                                        quantity++;
                                      },
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                        DottedLine(
                          dashColor: Theme.of(context).hintColor,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).highlightColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            child: Text(
                              "20% OFF DISCOUNT",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ButtonCustom(
                          onTap: () {},
                          backgroundColor: Theme.of(context).cardColor,
                          textButton: "ADD TO CART",
                          textStyle: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
