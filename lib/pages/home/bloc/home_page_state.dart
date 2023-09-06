class HomePageState {
  HomePageState({required this.index});
  final int index;

  HomePageState copyWith({int? index}) {
    return HomePageState(index: index ?? this.index);
  }
}
