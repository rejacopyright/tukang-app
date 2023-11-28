import 'package:go_router/go_router.dart';
import 'package:woless/chat/main.dart';
import 'package:woless/home/main.dart';
import 'package:woless/profile/main.dart';
import 'package:woless/search/main.dart';

// CustomTransitionPage buildPageWithDefaultTransition<T>({
//   required BuildContext context,
//   required GoRouterState state,
//   required Widget child,
// }) {
//   return CustomTransitionPage<T>(
//     key: state.pageKey,
//     child: child,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//         FadeTransition(opacity: animation, child: child),
//   );
// }

List<GoRoute> routes() {
  return [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const HomeApp(),
      ),
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const SearchApp(),
      ),
    ),
    GoRoute(
      path: '/chat',
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const ChatApp(),
      ),
    ),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const ProfileApp(),
      ),
    ),
  ];
}
