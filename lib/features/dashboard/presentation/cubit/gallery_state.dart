class GalleryState {
  const GalleryState({this.isGridView = true});

  final bool isGridView;

  GalleryState copyWith({bool? isGridView}) {
    return GalleryState(isGridView: isGridView ?? this.isGridView);
  }
}
