


import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../entities/posts_entity.dart';

abstract class PostsRepository {
  Future<Either<AppException, List<PostEntity>>> getPosts();
}
