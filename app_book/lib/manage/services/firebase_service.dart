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

  static Stream<List<String>> getAllCategories() {
    return _firestore
        .collection('Manage')
        .doc('categories')
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists && snapshot.data()!.containsKey('categoryList')) {
        List<dynamic> categories = snapshot.data()!['categoryList'];
        return categories.map((e) => e.toString()).toList();
      }
      return [];
    });
  }

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

  static Stream<List<Book>> getBooksFromCategory(String categoryName) {
    return _firestore
        .collection('Manage')
        .doc('categories')
        .collection(categoryName)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Book.fromMap(doc.data())).toList());
  }

  static Future<List<Book>> getAllBooks() async {
    var categoriesSnapshot =
        await _firestore.collection('Manage').doc('categories').get();
    if (!categoriesSnapshot.exists) return [];

    List<dynamic> categories = categoriesSnapshot.data()!['categoryList'];
    var allBooksFutures =
        categories.map((category) => getBooksFromCategory(category).first);

    var allBooksLists = await Future.wait(allBooksFutures);
    return allBooksLists.expand((books) => books).toList();
  }
}
