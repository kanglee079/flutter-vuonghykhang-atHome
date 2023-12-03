import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../apps/config/const.dart';
import '../../../apps/route/route_name.dart';
import '../../../apps/route/route_params.dart';
import '../../../models/movie_models.dart';
import '../../../provider/movie_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: outlineInputBorderCustom(),
                        enabledBorder: outlineInputBorderCustom(),
                        disabledBorder: outlineInputBorderCustom(),
                      ),
                      onChanged: (value) {
                        if (timer != null) {
                          timer!.cancel();
                        }
                        timer = Timer(const Duration(seconds: 1), () {
                          context.read<MovieProvider>().searchMovies(value);
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.search),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: context.read<MovieProvider>().streamSearch,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Có lỗi xảy ra!');
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('Không có dữ liệu!');
                  }

                  List<SearchMovies> data =
                      List<SearchMovies>.from(snapshot.data ?? []);

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var movie = data[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.detailMovieName,
                            arguments: ParamsMovies(id: movie.id),
                          );
                        },
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.amber,
                            ),
                          ),
                          title: Text(movie.title),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
