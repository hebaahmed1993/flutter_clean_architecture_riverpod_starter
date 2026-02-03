import '../source/posts_remote_source.dart';
import '../../domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/posts_entity.dart';
import '../../../../core/error/exceptions.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteSource remoteSource;

  PostsRepositoryImpl(this.remoteSource);

  @override
  Future<Either<AppException, List<PostEntity>>> getPosts() async {
    final result = await remoteSource.getPosts();
    return result;
  }
}
