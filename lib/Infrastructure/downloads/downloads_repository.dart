import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/Domain/core/api_end_points.dart';

import 'package:netflix_app/Domain/core/failures/main_failure.dart';

import 'package:netflix_app/Domain/downloads/models/downloads.dart';

import '../../Domain/downloads/i_downloads_repo.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage() async {
    // TODO: implement getDownloadsImage
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = (response.data["results"] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

// final List<Downloads> downloadsList=[];
// for(final raw in response.data){
//   downloadsList.add(Downloads.fromJson(raw as Map<String,dynamic>));
// }
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());

      return const Left(MainFailure.clientFailure());
    }
  }
}
