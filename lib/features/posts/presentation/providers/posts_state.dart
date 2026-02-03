import '../../../../core/enums/request_status.dart';
import '../../domain/entities/posts_entity.dart';

class PostsState {
  final RequestStatus postsStatus;
  final List<PostEntity> posts;
  final String? errorMessage;

  const PostsState({
    required this.postsStatus,
    required this.posts,
    this.errorMessage,
  });

  factory PostsState.initial() {
    return const PostsState(
      postsStatus: RequestStatus.initial,
      posts: [],
      errorMessage: null,
    );
  }

  PostsState copyWith({
    RequestStatus? postsStatus,
    List<PostEntity>? posts,
    String? errorMessage,
  }) {
    return PostsState(
      postsStatus: postsStatus ?? this.postsStatus,
      posts: posts ?? this.posts,
      errorMessage: errorMessage,
    );
  }
}
