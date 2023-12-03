import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:train_getapi/provider/auth_provider.dart';

Future<void> showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Xác nhận'),
        content: const Text('Bạn có chắc muốn đăng xuất?'),
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
              context.read<AuthProvider>().logout();
              Navigator.of(dialogContext).pop();
            },
          ),
        ],
      );
    },
  );
}
