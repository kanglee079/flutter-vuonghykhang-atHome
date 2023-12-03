import 'package:app_book/manage/services/firebase_service.dart';
import 'package:app_book/models/book_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../apps/helper/randomId.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/item_dropdown.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  List<String> categories = [];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  void loadCategories() async {
    List<String> categoryList = await FirebaseService.getAllCategories();
    setState(() {
      categories = categoryList;
    });
  }

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
            "Thêm sách",
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
              ItemDropdown(
                dropDown: DropdownSearch<String>(
                  popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                  ),
                  items: categories,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                    print(selectedValue);
                  },
                ),
              ),
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
          onTap: () {
            var rdId = generateRandomId();
            if (selectedValue!.isNotEmpty) {
              FirebaseService.addBookToCategory(
                  selectedValue!,
                  Book(
                    id: rdId,
                    bookName: nameBookController.text,
                    authorName: nameAuthorController.text,
                    nameCategory: selectedValue,
                    desc: descController.text,
                    photoUrl: "",
                    pdfUrl: "",
                  ));
            }
            nameBookController.clear();
            nameAuthorController.clear();
            descController.clear();
            selectedValue = "";
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
