import 'package:flutter/widgets.dart';
import 'package:like_image/pages/my_app.dart';
import 'package:like_image/providers/item_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ItemProvider(),
      child: const MyApp(),
    ),
  );
}
