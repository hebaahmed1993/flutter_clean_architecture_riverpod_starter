

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';

import 'package:dartz/dartz.dart';

import '../models/posts_model.dart';
import '../../../../core/error/exceptions.dart';

class PostsRemoteSource {
  final DioClient dioClient;
  PostsRemoteSource(this.dioClient);

  Future<Either<AppException, List<PostModel>>> getPosts() async {
    final result = await dioClient.getEither(
      ApiUrls.posts,
      function: FunctionType.fetchPosts,
    );

    return result.fold(
          (error) => Left(error),
          (response) {
        final data = response.data as List;
        final posts = data.map((e) => PostModel.fromJson(e)).toList();
        return Right(posts);
      },
    );
  }
}
