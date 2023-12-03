import 'package:app_food/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../config/const.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/product';
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool change = true;
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    var product =
        Provider.of<ProductProvider>(context).getItemWithId(arg['id']);

    print(product);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    product.image,
                  ),
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const Positioned(
                    top: 20,
                    left: 20,
                    child: BackButton(
                      color: dColorIconButtonInactive,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (() {
                                product.toggleIsFavorite();
                                setState(() {
                                  change = !change;
                                });
                              }),
                              child: Icon(
                                Icons.favorite,
                                color: product.isFavorite
                                    ? dColorIconButtonActive
                                    : dColorIconButtonInactive,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              product.favorite,
                              style: styleTextItem,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timelapse),
                            SizedBox(width: 10),
                            Text("123", style: styleTextItem),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/background/background_product.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Text(product.title),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            width: 120,
                            height: 35,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Nguyên Liệu",
                                style: styleTitleItem,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(product.ingredients),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: 140,
                            height: 35,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Cách thực hiện",
                                style: styleTitleItem,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(product.instructions),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
