




import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/providers.dart';
import '../../data/repositories/posts_repository_impl.dart';
import '../../data/source/posts_remote_source.dart';
import '../../domain/repositories/posts_repository.dart';
import 'posts_controller.dart';
import 'posts_state.dart';

final postsRemoteSourceProvider = Provider<PostsRemoteSource>((ref) {
  final dio = ref.read(dioClientProvider);
  return PostsRemoteSource(dio);
});

final postsRepositoryProvider = Provider<PostsRepository>((ref) {
  final remote = ref.read(postsRemoteSourceProvider);
  return PostsRepositoryImpl(remote);
});

final postsControllerProvider =
StateNotifierProvider<PostsController, PostsState>((ref) {
  final repo = ref.read(postsRepositoryProvider);
  return PostsController(repository: repo);
});
