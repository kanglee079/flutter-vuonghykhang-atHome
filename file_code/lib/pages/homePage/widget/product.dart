import 'package:flutter/material.dart';

import '../../../config/const.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
                ),
              ),
            ),
            child: Row(
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite),
                      SizedBox(width: 10),
                      Text("2123", style: styleTextItem),
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
          ),
        ),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                    "Est nihil impedit voluptates reprehenderit rerum. Omnis molestiae in sapiente quia dolor rerum atque rerum. Pariatur vero ea natus et sunt a illo molestiae amet. Enim ipsa repellat magnam est officiis. Assumenda distinctio quis non."),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Container(
                      width: 120,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
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
                        color: Colors.amber,
                      ),
                      child: const Text(
                          "Est rerum tam praesentium et. Enim assumenda et consectetur quae totam labore officiis. Quidem omnis eveniet porro consectetur dolores quis. Et et aut. Maiores voluptatem qui magni sit perferendis quos quia suscipit. Doloremque repudiandae dolores ut repellat est ratione quia doloremque nisi."),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 120,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
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
                        color: Colors.amber,
                      ),
                      child: const Text(
                          "Est rerum tam praesentium et. Enim assumenda et consectetur quae totam labore officiVeniam aut repellat minima aut atque magnam omnis et. Voluptatem laborum ea totam ad aut rerum omnis nam. Necessitatibus vero enim fugiat doloribus ut suscipit omnis. Fuga necessitatibus aut voluptatibus vel omnis et ipsum. Earum aut dolor accusamus facere. Qui debitis saepe ducimus accusamus perferendis esse voluptas nisi.is. Quidem omnis eveniet porro consectetur dolores quis. Et et aut. Maiores voluptatem qui magni sit perferendis quos quia suscipit. Doloremque repudiandae dolores ut repellat est ratione quia doloremque nisi."),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
