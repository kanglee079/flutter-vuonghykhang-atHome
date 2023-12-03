import 'package:app_shopping/services/firebase_service.dart';
import 'package:flutter/material.dart';

import '../../../widgets/items_order.dart';

class MyOrderAllPage extends StatelessWidget {
  const MyOrderAllPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseService.ordersRef.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  final docs = snapshot.data!.docs;
                  // final data = snapshot.data;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: docs.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(height: 10, color: Colors.grey);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ItemsOrder(
                        id: docs[index].id,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
