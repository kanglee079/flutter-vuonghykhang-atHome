import 'package:app_shopping/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';

Future<void> showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Xác nhận'),
        content: const Text(
          'Bạn có chắc muốn đăng xuất?',
          style: TextStyle(color: Colors.blue),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Hủy'),
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
          ),
          TextButton(
            child: const Text('Đăng xuất'),
            onPressed: () {
              context.read<FavoriteProvider>().saveFavoritesToFirebase();
              context.read<AuthProvider>().logout();
              Navigator.of(dialogContext).pop();
            },
          ),
        ],
      );
    },
  );
}
