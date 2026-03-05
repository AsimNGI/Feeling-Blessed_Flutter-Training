import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/data/data_source.dart';
import 'package:flutter_training/theme/app_text_styles.dart';
import 'package:flutter_training/utils/app_padding.dart';
import 'package:flutter_training/utils/app_strings.dart';

import '../utils/app_navigation.dart';
import '../widgets/album_item_grid_widget.dart';
import '../widgets/album_item_list_widget.dart';

class MyGallery extends StatefulWidget {
  const MyGallery({super.key});

  @override
  State<MyGallery> createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          AppScreensNavigations.navigateToHome(context, "456");
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 10.h),
          child: Padding(
            padding: AppPadding.appBarPadding,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              title: Text(AppStrings.albums, style: AppTextStyles.headlineLarge),
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
              Padding(
                padding: AppPadding.all16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isGridView ? AppStrings.gridStyle : AppStrings.listStyle,
                      style: AppTextStyles.titleMedium,
                    ),
                    Switch(
                      value: isGridView,
                      onChanged: (value) => setState(() => isGridView = value),
                    ),
                  ],
                ),
              ),
              AppPadding.vertical16,
              isGridView
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
                      itemCount: AlbumDataSource.albums.length,
                      itemBuilder: (context, index) =>
                          AlbumItemGridWidget(album: AlbumDataSource.albums[index]),
                    )
                  : ListView.builder(
                      padding: AppPadding.all16,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: AlbumDataSource.albums.length,
                      itemBuilder: (context, index) => Padding(
                        padding: AppPadding.only(bottom: 12),
                        child: AlbumItemListWidget(album: AlbumDataSource.albums[index]),
                      ),
                    ),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }
}
