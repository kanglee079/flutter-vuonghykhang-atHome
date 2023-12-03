import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:train_getapi/models/movie_models.dart';
import 'package:train_getapi/provider/movie_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailMovie extends StatelessWidget {
  int id;
  DetailMovie({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Movie"),
      ),
      body: FutureBuilder(
        future: context.read<MovieProvider>().getDetailMovie(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          DetailMovies data = snapshot.data as DetailMovies;
          return Hero(
            tag: data.id,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                          "https://image.tmdb.org/t/p/w500/${data.backdrop_path}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.original_title,
                            style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.overview,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
