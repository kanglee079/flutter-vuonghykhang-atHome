import 'package:app_book/manage/services/firebase_service.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_text_field.dart';

class AddCategoryPage extends StatelessWidget {
  const AddCategoryPage({super.key});
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
            "Thêm thể loại",
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
          onTap: () {
            if (nameCategoryController.text.isNotEmpty) {
              FirebaseService.addCategory(nameCategoryController.text);
            }
            nameCategoryController.clear();
          },
          child: Ink(
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: Center(
                child: Text(
                  "Thêm thể loại",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
