import 'package:app_book/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get firestore => _firestore;

  static Future<void> addCategory(String categoryName) async {
    DocumentReference categoriesDocRef =
        _firestore.collection('Manage').doc('categories');

    await categoriesDocRef.collection(categoryName).add({});

    await categoriesDocRef.set({
      'categoryList': FieldValue.arrayUnion([categoryName])
    }, SetOptions(merge: true));
  }

  static Future<List<String>> getAllCategories() async {
    var doc = await _firestore.collection('Manage').doc('categories').get();
    if (doc.exists && doc.data()!.containsKey('categoryList')) {
      List<dynamic> categories = doc.data()!['categoryList'];
      return categories.map((e) => e.toString()).toList();
    }
    return [];
  }

  // Phương thức để thêm một cuốn sách vào một thể loại cụ thể
  static Future<void> addBookToCategory(String categoryName, Book book) async {
    if (categoryName.isEmpty) {
      print("Tên thể loại không thể rỗng");
    }
    await _firestore
        .collection('Manage')
        .doc('categories')
        .collection(categoryName)
        .doc(book.id)
        .set(book.toMap());
  }

  // Phương thức để lấy tất cả sách từ một thể loại
  static Future<List<Book>> getBooksFromCategory(String categoryName) async {
    var snapshot = await _firestore
        .collection('Manage')
        .doc('categories')
        .collection(categoryName)
        .get();

    return snapshot.docs.map((doc) => Book.fromMap(doc.data())).toList();
  }
}
