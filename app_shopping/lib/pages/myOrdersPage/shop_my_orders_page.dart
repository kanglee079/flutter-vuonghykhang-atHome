import 'package:app_shopping/pages/myOrdersPage/components/my_order_all.dart';
import 'package:app_shopping/pages/myOrdersPage/components/my_order_cancel.dart';
import 'package:app_shopping/pages/myOrdersPage/components/my_order_complete.dart';
import 'package:app_shopping/pages/myOrdersPage/components/my_order_on_deliver.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Text(
                "My Orders",
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
        bottom: TabBar(
          labelColor: Theme.of(context).cardColor,
          labelStyle: TextStyle(
            color: Theme.of(context).cardColor,
            fontWeight: FontWeight.w700,
          ),
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'On Deliver'),
            Tab(text: 'Complete'),
            Tab(text: 'Cancel'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MyOrderAllPage(),
          MyOrderOnDeliverPage(),
          MyOrderCompletePage(),
          MyOrderCancelPage()
        ],
      ),
    );
  }
}
