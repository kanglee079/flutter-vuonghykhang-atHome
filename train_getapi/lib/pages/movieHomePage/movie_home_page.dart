import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:train_getapi/apps/route/route_name.dart';
import 'package:train_getapi/apps/route/route_params.dart';
import 'package:train_getapi/models/movie_models.dart';
import 'package:train_getapi/provider/auth_provider.dart';
import 'package:train_getapi/provider/movie_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeMoviePage extends StatefulWidget {
  const HomeMoviePage({super.key});

  @override
  State<HomeMoviePage> createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int page = 1;

  @override
  void initState() {
    context.read<MovieProvider>().getMovie(page);
    super.initState();
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    page = 1;
    context.read<MovieProvider>().getMovie(page);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    page++;
    context.read<MovieProvider>().getMovie(page);
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.settingName);
                      },
                      icon: const Icon(Icons.settings)),
                  Expanded(
                    child: Text(
                      "The Movie",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<AuthProvider>().logout();
                    },
                    icon: const Icon(Icons.logout),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.searchName);
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Tìm Kiếm",
                      style: Theme.of(context).textTheme.labelMedium,
                    )),
                    const Icon(Icons.search),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: StreamBuilder(
                  stream: context.read<MovieProvider>().streamMovie,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    List<Movies> data = List<Movies>.from(snapshot.data ?? []);
                    return SmartRefresher(
                      enablePullUp: true,
                      enablePullDown: true,
                      header: const WaterDropMaterialHeader(
                        distance: 30,
                      ),
                      onRefresh: _onRefresh,
                      onLoading: _onLoading,
                      controller: _refreshController,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.4 / 2,
                        ),
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Hero(
                            tag: data[index].id,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteName.detailMovieName,
                                  arguments: ParamsMovies(id: data[index].id),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: FadeInImage.memoryNetwork(
                                        width: double.infinity,
                                        placeholder: kTransparentImage,
                                        image:
                                            "https://image.tmdb.org/t/p/w500/${data[index].poster_path}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      data[index].title,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
