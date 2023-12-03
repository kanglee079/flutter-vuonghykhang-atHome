import 'package:flutter/material.dart';

import '../../../widgets/custom_text_field.dart';

class EditCategoryPage extends StatelessWidget {
  const EditCategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController nameCategoryController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Sửa thể loại",
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
              CustomTextField(
                nameField: "Tên thể loại:",
                icon: Icons.category_outlined,
                controller: nameCategoryController,
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
                "Sửa thể loại",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
