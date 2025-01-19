import 'package:Palettes/app/cubit/wallpaper_state.dart';
import 'package:Palettes/app/widgets/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Palettes/app/app.dart';
import 'package:Palettes/shared/models/models.dart';

import '../widgets/custom_search_dialog.dart';
import '../widgets/home_category_list_buttons.dart';
import '../widgets/home_colors_tone_list.dart';
import '../widgets/home_search_title.dart';
import '../widgets/home_wallpaper_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WallpaperCubit get cubit => context.read<WallpaperCubit>();

  final _textController = TextEditingController();

  HomeSearchTitleModel searchTitleModel = const HomeSearchTitleModel.toplist();

  @override
  void initState() {
    super.initState();
    cubit.fetchWallpaper();
    searchTitleModel = cubit.state.homeSearchTitleModel;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.transparent, // Background color
              ),
              titlePadding: EdgeInsets.zero, // Remove default title padding
              title: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0), // Adjust padding as needed
                  child: Text(
                    'Palettes',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black87, // Adjust text color if needed
                    ),
                  ),
                ),
              ),
              collapseMode: CollapseMode.pin,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  HomeSearchBar(
                    textController: _textController,
                    onFilterPressed: () => showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext _) {
                        return CustomSearchDialog(ctx: context);
                      },
                    ),
                    onSearchPressed: () async {
                      setState(
                            () => searchTitleModel = _textController.text.isEmpty
                            ? cubit.state.wallQuery.sorting == WallpaperSorting.toplist
                            ? const HomeSearchTitleModel.toplist()
                            : cubit.state.wallQuery.sorting == WallpaperSorting.hot
                            ? const HomeSearchTitleModel.hot()
                            : cubit.state.wallQuery.sorting == WallpaperSorting.latest
                            ? const HomeSearchTitleModel.latest()
                            : cubit.state.wallQuery.sorting == WallpaperSorting.random
                            ? const HomeSearchTitleModel.random()
                            : HomeSearchTitleModel.search(
                          cubit.state.wallQuery.sorting!.name,
                        )
                            : HomeSearchTitleModel.search(_textController.text),
                      );
                      cubit.updateStatus(HomeStatus.loading);
                      await cubit.fetchWallpaper(
                        wallQuery: cubit.state.wallQuery.copyWith(
                          query: _textController.text,
                          page: 1,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  HomeSearchTitle(
                    model: searchTitleModel,
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => WallpaperListPage(
                          ctx: context,
                          titleModel: searchTitleModel,
                        ),
                      ),
                    ),
                  ),
                  HomeWallpaperList(
                    onRefresh: () async {
                      cubit.updateStatus(HomeStatus.loading);
                      await cubit.fetchWallpaper();
                    },
                  ),
                  const SizedBox(height: 10),
                  const HomeColorsToneList(),
                  const SizedBox(height: 12),
                  HomeCategoryListButtons(
                    toplistOnPressed: () async {
                      _textController.clear();
                      setState(
                            () => searchTitleModel = const HomeSearchTitleModel.toplist(),
                      );
                      cubit
                        ..updateStatus(HomeStatus.loading)
                        ..updateHomeSearchTitleModel(
                          const HomeSearchTitleModel.toplist(),
                        );
                      await cubit.fetchWallpaper(
                        wallQuery: WallpaperQuery(
                          category: null,
                          purity: null,
                          order: null,
                          topRange: null,
                          apikey: cubit.state.wallQuery.apikey,
                        ),
                      );
                    },
                    latestOnPressed: () async {
                      _textController.clear();
                      setState(
                            () => searchTitleModel = const HomeSearchTitleModel.latest(),
                      );
                      cubit
                        ..updateStatus(HomeStatus.loading)
                        ..updateHomeSearchTitleModel(
                          const HomeSearchTitleModel.latest(),
                        );
                      await cubit.fetchWallpaper(
                        wallQuery: WallpaperQuery(
                          category: null,
                          purity: null,
                          sorting: WallpaperSorting.latest,
                          order: null,
                          apikey: cubit.state.wallQuery.apikey,
                        ),
                      );
                    },
                    hotOnPressed: () async {
                      _textController.clear();
                      setState(
                            () => searchTitleModel = const HomeSearchTitleModel.hot(),
                      );
                      cubit
                        ..updateStatus(HomeStatus.loading)
                        ..updateHomeSearchTitleModel(
                          const HomeSearchTitleModel.hot(),
                        );
                      await cubit.fetchWallpaper(
                        wallQuery: WallpaperQuery(
                          category: null,
                          purity: null,
                          sorting: WallpaperSorting.hot,
                          order: null,
                          apikey: cubit.state.wallQuery.apikey,
                        ),
                      );
                    },
                    randomOnPressed: () async {
                      _textController.clear();
                      setState(
                            () => searchTitleModel = const HomeSearchTitleModel.random(),
                      );
                      cubit
                        ..updateStatus(HomeStatus.loading)
                        ..updateHomeSearchTitleModel(
                          const HomeSearchTitleModel.random(),
                        );
                      await cubit.fetchWallpaper(
                        wallQuery: WallpaperQuery(
                          category: null,
                          purity: null,
                          sorting: WallpaperSorting.random,
                          order: null,
                          apikey: cubit.state.wallQuery.apikey,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
