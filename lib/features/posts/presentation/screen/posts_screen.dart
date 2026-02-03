import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enums/request_status.dart';
import '../providers/posts_providers.dart';

class PostsScreen extends ConsumerStatefulWidget {
  const PostsScreen({super.key});

  @override
  ConsumerState<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends ConsumerState<PostsScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(postsControllerProvider.notifier).loadPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postsControllerProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
          centerTitle: true,
        ),

        body: Builder(
          builder: (_) {
            if (state.postsStatus == RequestStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.postsStatus == RequestStatus.error) {
              return Center(
                child: Text(
                  state.errorMessage ?? "حدث خطأ",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (state.posts.isEmpty) {
              return const Center(
                child: Text("لا توجد بيانات"),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.posts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, index) {
                final post = state.posts[index];

                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        post.body,
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(postsControllerProvider.notifier).loadPosts();
          },
          child: const Icon(Icons.refresh),
        ),



      ),
    );
  }
}
