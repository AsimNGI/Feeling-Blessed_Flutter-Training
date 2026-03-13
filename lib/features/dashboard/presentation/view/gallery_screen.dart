import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/core/constants/app_padding.dart';
import 'package:flutter_training/core/constants/app_strings.dart';
import 'package:flutter_training/core/global/theme/app_styles.dart';
import 'package:flutter_training/core/routing/app_screens_navigations.dart';
import 'package:flutter_training/features/dashboard/domain/entity/response/album_items.dart';
import 'package:flutter_training/features/dashboard/presentation/cubit/gallery_cubit.dart';
import 'package:flutter_training/features/dashboard/presentation/cubit/gallery_state.dart';

import '../widgets/album_item_grid_widget.dart';
import '../widgets/album_item_list_widget.dart';

class MyGallery extends StatelessWidget {
  final List<AlbumItems> albums;
  const MyGallery({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    final s = AppStyles.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 10.h),
        child: Padding(
          padding: AppPadding.appBarPadding,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Text(AppStrings.albums, style: s.headlineLarge),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<GalleryCubit, GalleryState>(
              buildWhen: (previous, current) => previous.isGridView != current.isGridView,
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: AppPadding.all16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.isGridView ? AppStrings.gridStyle : AppStrings.listStyle,
                            style: s.titleMedium,
                          ),
                          Switch(
                            value: state.isGridView,
                            onChanged: (value) => context.read<GalleryCubit>().setGridView(value),
                          ),
                        ],
                      ),
                    ),
                    AppPadding.vertical16,
                    state.isGridView
                        ? GridView.builder(
                            padding: AppPadding.all16,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10.h,
                              crossAxisSpacing: 10.w,
                              childAspectRatio: 1 / 1.2,
                            ),
                            itemCount: albums.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => AppScreensNavigations.navigateToGalleryDetail(
                                context,
                                albums[index],
                              ),
                              child: AlbumItemGridWidget(album: albums[index]),
                            ),
                          )
                        : ListView.builder(
                            padding: AppPadding.all16,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: albums.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => AppScreensNavigations.navigateToGalleryDetail(
                                context,
                                albums[index],
                              ),
                              child: Padding(
                                padding: AppPadding.only(bottom: 12),
                                child: AlbumItemListWidget(album: albums[index]),
                              ),
                            ),
                          ),
                  ],
                );
              },
            ),
            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }
}
