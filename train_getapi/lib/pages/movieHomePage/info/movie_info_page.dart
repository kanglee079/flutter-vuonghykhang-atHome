import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:train_getapi/provider/info_provider.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin người dùng'),
      ),
      body: Center(
        child: Consumer<InfoProvider>(
          builder: (context, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<String?>(
                  stream: provider.imageUrlStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        !snapshot.hasData) {
                      provider.getImageUrlForUser();
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Lỗi: ${snapshot.error}');
                    }

                    final imageUrl = snapshot.data;

                    if (imageUrl != null) {
                      return Container(
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return const Icon(Icons.person, size: 50);
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                if (provider.uploadProgress != null)
                  SizedBox(
                    width: 100,
                    child: LinearProgressIndicator(
                      value: provider.uploadProgress,
                      minHeight: 10,
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    provider.uploadAvatar();
                  },
                  child: const Text("Change Avatar"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
