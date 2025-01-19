import 'package:Palettes/app/cubit/wallpaper_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

// Ensure these imports are correct and exist in your project
import '../cubit/wallpaper_cubit.dart';
import '../widgets/rounded_square_button.dart';

// Dummy implementations; replace with actual implementations
class Repository {
  Future<void> setWallpaper(String url, int location, Size size) async {
    // Implement your logic here
  }
}

class RepositoryImpl implements Repository {
  final DataSource dataSource;

  RepositoryImpl(this.dataSource);

  @override
  Future<void> setWallpaper(String url, int location, Size size) async {
    // Implement your logic here
  }
}

class DataSource {}

class DataSourceImpl implements DataSource {}

class WallpaperEntity {
  final String url;

  WallpaperEntity({required this.url});
}

class WallpaperDetailsPage extends StatefulWidget {
  const WallpaperDetailsPage({required this.id, required this.url, super.key});

  final String id;
  final String url;

  @override
  State<WallpaperDetailsPage> createState() => _WallpaperDetailsPageState();
}

class _WallpaperDetailsPageState extends State<WallpaperDetailsPage> {
  bool setWallpaperState = false;
  BoxFit fit = BoxFit.cover;

  @override
  void initState() {
    super.initState();
    context.read<WallpaperCubit>().getWallpaperInfo(id: widget.id);
  }

  void _showBottomCard({
    required BuildContext context,
    required WidgetRef ref,
    required ColorScheme colors,
    required Repository repository,
    required WallpaperEntity wallpaperEntity,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: colors.surface,
      showDragHandle: true,
      useSafeArea: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.36,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                'Select Wallpaper', // Replace with your localization key if needed
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'Choose where to apply the wallpaper', // Replace with your localization key if needed
                style: Theme.of(context).textTheme.bodySmall!,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              _ModalButton(
                textButton: 'Home Screen', // Replace with your localization key if needed
                wallpaperEntity: wallpaperEntity,
                screenLocation: WallpaperManager.HOME_SCREEN,
              ),
              const SizedBox(height: 5),
              _ModalButton(
                textButton: 'Lock Screen', // Replace with your localization key if needed
                wallpaperEntity: wallpaperEntity,
                screenLocation: WallpaperManager.LOCK_SCREEN,
              ),
              const SizedBox(height: 5),
              _ModalButton(
                textButton: 'Both Screens', // Replace with your localization key if needed
                wallpaperEntity: wallpaperEntity,
                screenLocation: WallpaperManager.BOTH_SCREEN,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final repository = RepositoryImpl(DataSourceImpl());
    final wallpaperEntity = WallpaperEntity(url: widget.url);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: widget.url,
            filterQuality: FilterQuality.high,
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator.adaptive()),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
            ),
            height: double.infinity,
            width: double.infinity,
            fit: fit,
          ),
          Positioned(
            top: 48,
            left: 16,
            child: IconButton(
              icon: const Icon(CupertinoIcons.back),
              color: Colors.white,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white24),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            top: 48,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.aspect_ratio_outlined),
              color: Colors.white,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white24),
              ),
              onPressed: () => setState(
                    () => fit = fit == BoxFit.cover ? BoxFit.fitWidth : BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 16,
            child: setWallpaperState == false
                ? GestureDetector(
              onTap: () {
                setState(() {
                  setWallpaperState = true;
                });
                _showBottomCard(
                  context: context,
                  ref: context.read<WidgetRef>(), // Replace with appropriate WidgetRef
                  colors: colors,
                  repository: repository,
                  wallpaperEntity: wallpaperEntity,
                );
              },
              child: ClipOval(
                child: Container(
                  color: Colors.white,
                  height: 60,
                  width: 60,
                  child: const Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ),
              ),
            )
                : ClipOval(
              child: Container(
                color: Colors.white,
                height: 60,
                width: 60,
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 5,
            right: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedSquareButton(
                  name: 'Info', // Replace with localization key if needed
                  icon: CupertinoIcons.info,
                  action: () => showModalBottomSheet<void>(
                    context: context,
                    backgroundColor: Colors.grey[850],
                    showDragHandle: true,
                    useSafeArea: true,
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.36,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Text(
                              'Wallpaper Info', // Replace with localization key if needed
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Details about the wallpaper go here.', // Replace with localization key if needed
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('OK'), // Replace with localization key if needed
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                RoundedSquareButton(
                  name: 'Save', // Replace with localization key if needed
                  icon: Icons.download,
                  action: () => showModalBottomSheet<void>(
                    context: context,
                    backgroundColor: Colors.grey[850],
                    showDragHandle: true,
                    useSafeArea: true,
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.36,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Text(
                              'Saving Wallpaper', // Replace with localization key if needed
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () {
                                context.read<WallpaperCubit>().shareWallpaper(url: widget.url, isFile: true)
                                    .then((value) => Navigator.of(context).pop());
                              },
                              child: Text('Share as File'), // Replace with localization key if needed
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<WallpaperCubit>().shareWallpaper(url: widget.url, isFile: false)
                                    .then((value) => Navigator.of(context).pop());
                              },
                              child: Text('Share Link'), // Replace with localization key if needed
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Cancel'), // Replace with localization key if needed
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ModalButton extends StatelessWidget {
  final String textButton;
  final WallpaperEntity wallpaperEntity;
  final int screenLocation;

  const _ModalButton({
    required this.textButton,
    required this.wallpaperEntity,
    required this.screenLocation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: colors.onPrimary, backgroundColor: colors.primary,
        ),
        onPressed: () {
          final repository = RepositoryImpl(DataSourceImpl());

          // Assuming 'screenLocation' and 'wallpaperEntity.url' contain necessary data.
          context.read<WallpaperCubit>().setWallpaper(
            url: wallpaperEntity.url,
            screen: screenLocation,
          ); // Calls the method to set the wallpaper

          // Close the current screen
          Navigator.of(context).pop();

          // Once wallpaper is set, you can handle any final changes
          repository.setWallpaper(
            wallpaperEntity.url,
            screenLocation,
            MediaQuery.of(context).size,
          ).whenComplete(() => context.read<WallpaperCubit>().updateStatus(HomeStatus.success));
        }
        ,
        child: Text(textButton),
      ),
    );
  }
}
