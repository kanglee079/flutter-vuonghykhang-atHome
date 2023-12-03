import 'package:flutter/material.dart';

import '../../apps/route/route_name.dart';
import '../../widgets/text_form_custom.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
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
                    child: TextFormCustom(
                      controller: searchController,
                      iconPrefix: Icons.search,
                      hintText: "Type Your Search",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.searchFiltersName);
                    },
                    icon: const Icon(
                      Icons.filter_alt,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Recent Search",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Clear all",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(123);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: 30,
                            color: Theme.of(context).hintColor,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              "Tomatos",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.cancel,
                              size: 30,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Divider(
                thickness: 5,
                color: Theme.of(context).hintColor,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Search Result",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Text(
                    "Newest",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(height: 30, color: Colors.grey);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return null;

                    // return ItemsWithCategories(
                    //   ontap: () {
                    //     Navigator.pushNamed(
                    //         context, RouteName.detailProductName);
                    //   },
                    // );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
