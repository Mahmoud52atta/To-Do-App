import 'package:go_router/go_router.dart';
import 'package:tasky_app/feature/splash/presentation/views/splash_view.dart';
import 'package:tasky_app/feature/splash/presentation/views/start_view.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/add_task_view.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/details_view.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/home_tasks.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/profile_view.dart';

abstract class AppRouters {
  static const kStartView = '/firstView';
  static const kHomeTasks = '/homeTasks';
  static const kProfilView = '/profileView';
  static const kAddTaskView = '/addTaskView';
  static const kDetailsView = '/detailsView';

  static final router = GoRouter(initialLocation: kHomeTasks, routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kStartView,
      builder: (context, state) => const StartView(),
    ),
    GoRoute(
      path: kHomeTasks,
      builder: (context, state) => const HomeTasks(),
    ),
    GoRoute(
      path: kProfilView,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: kAddTaskView,
      builder: (context, state) => const AddTaskView(),
    ),
    GoRoute(
      path: kDetailsView,
      builder: (context, state) => DetailsView(),
    ),
  ]);
}
