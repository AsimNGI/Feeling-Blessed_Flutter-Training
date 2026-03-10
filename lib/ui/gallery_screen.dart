import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_training/bloc/update_ui_cubit.dart';
import 'package:flutter_training/data/data_source.dart';
import 'package:flutter_training/theme/app_text_styles.dart';
import 'package:flutter_training/utils/app_padding.dart';
import 'package:flutter_training/utils/app_strings.dart';

import '../bloc/meta_cubit.dart';
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
              BlocBuilder<UpdateUiCubit, Color>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      context.read<UpdateUiCubit>().updateColor('asim');
                    },
                    child: Container(height: 100.h, width: 100.w, color: state),
                  );
                },
              ),
              30.verticalSpace,
              BlocListener<MetaCubit, MetaState>(
                listener: (context, state) {
                  if (state is MetaLoadedState) {}
                },
                child: BlocBuilder<MetaCubit, MetaState>(
                  builder: (context, state) {
                    if (state is MetaLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is MetaLoadedState) {
                      // print('state.bannerImage: ${state.bannerImage}');
                      return InkWell(
                        onTap: () {
                          context.read<MetaCubit>().fetchMeta();
                        },
                        child: Image.network(
                          state.bannerImage,
                          errorBuilder: (context, error, stackTrace) =>
                              const Text('image not loaded'),
                        ),
                      );
                    } else if (state is MetaErrorState) {
                      return Text(state.error);
                    }
                    return ElevatedButton(
                      onPressed: () {
                        context.read<MetaCubit>().fetchMeta();
                      },
                      child: Text('Fetch Meta'),
                    );
                  },
                ),
              ),
              30.verticalSpace,

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
