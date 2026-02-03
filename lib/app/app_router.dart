



import 'package:go_router/go_router.dart';

import '../features/posts/presentation/screen/posts_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/posts',
    routes: [
      GoRoute(
        path: '/posts',
        builder: (context, state) =>  PostsScreen(),
      ),
    ],
  );
}


