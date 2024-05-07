part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState({
    required List<Downloads> videoList,
    // required List<int>likedVideosIds,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory FastLaughState.initial() => FastLaughState(
        videoList: [],
        isLoading: true,
        isError: false,
      );
}
