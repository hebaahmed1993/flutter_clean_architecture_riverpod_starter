
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../core/enums/request_status.dart';
import '../../domain/repositories/posts_repository.dart';
import 'posts_state.dart';

class PostsController extends StateNotifier<PostsState> {
  final PostsRepository repository;

  PostsController({required this.repository})
      : super(PostsState.initial());

  Future<void> loadPosts() async {
    state = state.copyWith(postsStatus: RequestStatus.loading);

    final result = await repository.getPosts();

    result.fold(
          (error) {
        state = state.copyWith(
          postsStatus: RequestStatus.error,
          errorMessage: error.message,
        );
      },
          (posts) {
        state = state.copyWith(
          postsStatus: RequestStatus.success,
          posts: posts,
          errorMessage: null,
        );
      },
    );
  }
}
