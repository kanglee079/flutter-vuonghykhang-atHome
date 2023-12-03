import 'package:flutter/material.dart';

import '../../../widgets/custom_text_field.dart';

class EditBookPage extends StatelessWidget {
  const EditBookPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController nameBookController = TextEditingController();
    TextEditingController nameAuthorController = TextEditingController();
    TextEditingController descController = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Sửa sách",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const ItemDropdown(),
              const SizedBox(height: 20),
              CustomTextField(
                nameField: "Tên sách:",
                icon: Icons.category_outlined,
                controller: nameBookController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                nameField: "Tên tác giả:",
                icon: Icons.attribution_sharp,
                controller: nameAuthorController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                nameField: "Mô tả:",
                icon: Icons.description,
                controller: descController,
              ),
            ],
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 55,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Center(
              child: Text(
                "Sửa sách",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
