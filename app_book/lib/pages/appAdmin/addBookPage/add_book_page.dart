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
  String? selectedValue;
  TextEditingController nameBookController = TextEditingController();
  TextEditingController nameAuthorController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController photoUrlController = TextEditingController();
  TextEditingController pdfUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              StreamBuilder<List<String>>(
                stream: FirebaseService.getAllCategories(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<String>> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text('Chưa kết nối.');
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        List<String> categories = snapshot.data!;
                        return ItemDropdown(
                          dropDown: DropdownSearch<String>(
                            popupProps: const PopupProps.menu(
                              showSelectedItems: true,
                            ),
                            items: categories,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                            onChanged: (newValue) {
                              selectedValue = newValue;
                            },
                            selectedItem: selectedValue,
                          ),
                        );
                      } else {
                        return const Text('Không có dữ liệu.');
                      }
                  }
                },
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
                icon: Icons.description_outlined,
                controller: descController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                nameField: "Đường dẫn hình ảnh:",
                icon: Icons.photo_library_outlined,
                controller: photoUrlController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                nameField: "Đường dẫn PDF:",
                icon: Icons.picture_as_pdf_outlined,
                controller: pdfUrlController,
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
            photoUrlController.clear();
            pdfUrlController.clear();
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
