import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/Domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/Domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];

ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  // @injectable
  FastLaughBloc(
    IDownloadsRepo _downloadsService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //sending loading to ui

      emit(FastLaughState(
        videoList: [],
        isLoading: true,
        isError: false,
        // likedVideosIds: [],
      ));

      // get trending movies

      final _result = await _downloadsService.getDownloadsImage();
      final _state = _result.fold((f) {
        return FastLaughState(
          videoList: [],
          isLoading: false,
          isError: true,
          //  likedVideosIds: state.likedVideosIds,
        );
      }, (resp) {
        return FastLaughState(
          videoList: resp,
          isLoading: false,
          isError: false, //likedVideosIds: state.likedVideosIds,
        );
      });

      // send to ui

      emit(_state);
    });

    on<LikeVideo>(
      (event, emit) async {
        likedVideosIdsNotifier.value.add(event.id);
        likedVideosIdsNotifier.notifyListeners();

        // var list=   state.likedVideosIds;
        //list..add(event.id);

        //emit(state.copyWith(likedVideosIds:list ));
      },
    );
    on<UnlikeVideo>((event, emit) async {
      likedVideosIdsNotifier.value.remove(event.id);

      // var list=     state.likedVideosIds;
      // list.remove(event.id);

      //   emit(state.copyWith(likedVideosIds:list ));
    });
  }
}
