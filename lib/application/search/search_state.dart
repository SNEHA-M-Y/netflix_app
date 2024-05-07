part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<SearchResultData> searchResultList,
    required List<Downloads> idleList,
    required bool isLoading,
    required bool isError,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
      searchResultList: [], idleList: [], isLoading: false, isError: false);

  // get idleList => null;

  // bool get isLoading => null;

  // bool get isError => null;

  // get idleList => null;

  // bool get isError => null;

  // bool get isLoading => null;
}
