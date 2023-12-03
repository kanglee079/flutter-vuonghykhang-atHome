import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../apps/function/dialog_logout.dart';
import '../../../provider/info_provider.dart';
import '../../../widgets/items_personal.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            child: Column(
              children: [
                Row(
                  children: [
                    Consumer<InfoProvider>(
                      builder: (context, value, child) {
                        return StreamBuilder<String?>(
                          stream: value.imageUrlStream,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.waiting &&
                                !snapshot.hasData) {
                              // value.getImageUrlForUser();
                              return const SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Text('Lỗi: ${snapshot.error}');
                            }

                            final imageUrl = snapshot.data;

                            if (imageUrl != null) {
                              return GestureDetector(
                                onTap: value.uploadAvatar,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            } else {
                              return const Icon(Icons.person, size: 50);
                            }
                          },
                        );
                      },
                    ),
                    const SizedBox(width: 21),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nam User",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.tag,
                              color: Theme.of(context).highlightColor,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Disc. 10%Off",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25),
                const Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
                const ItemsPersonal(
                  icon: Icons.discount_outlined,
                  nameItem: "Voucher & Discount",
                ),
                const ItemsPersonal(
                  icon: Icons.point_of_sale_outlined,
                  nameItem: "Caffely Point",
                ),
                const ItemsPersonal(
                  icon: Icons.local_activity_outlined,
                  nameItem: "Caffely Rewards",
                ),
                const ItemsPersonal(
                  icon: Icons.coffee_outlined,
                  nameItem: "Favorite Caffee",
                ),
                const ItemsPersonal(
                  icon: Icons.location_on_outlined,
                  nameItem: "Saved Address",
                ),
                const ItemsPersonal(
                  icon: Icons.payment_outlined,
                  nameItem: "Payment Methods",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "General",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const ItemsPersonal(
                  icon: Icons.person,
                  nameItem: "Personal Info",
                ),
                const ItemsPersonal(
                  icon: Icons.notifications_none_outlined,
                  nameItem: "Notification",
                ),
                const ItemsPersonal(
                  icon: Icons.security_outlined,
                  nameItem: "Security",
                ),
                const ItemsPersonal(
                  icon: Icons.language,
                  nameItem: "Language",
                  isLanguage: true,
                ),
                const ItemsPersonal(
                  icon: Icons.dark_mode,
                  nameItem: "Dark Mode",
                  isSwitchItem: true,
                ),
                ItemsPersonal(
                  icon: Icons.logout,
                  nameItem: "Log Out",
                  ontap: () {
                    showLogoutConfirmationDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
