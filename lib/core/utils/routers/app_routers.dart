import 'package:go_router/go_router.dart';
import 'package:to_do_app/feature/auth/presentation/view/sign_in_view.dart';
import 'package:to_do_app/feature/auth/presentation/view/sign_up_view.dart';
import 'package:to_do_app/feature/splash/presentation/views/splash_view.dart';
import 'package:to_do_app/feature/splash/presentation/views/start_view.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/add_task_view.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/details_view.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/home_tasks.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/profile_view.dart';

abstract class AppRouters {
  static const kStartView = '/firstView';
  static const kHomeTasks = '/homeTasks';
  static const kProfileView = '/profileView';
  static const kAddTaskView = '/addTaskView';
  static const kDetailsView = '/detailsView';
  static const kSignInView = '/signInView';
  static const kSignUpView = '/signUpView';

  static final router = GoRouter(initialLocation: kSignInView, routes: [
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
      path: kProfileView,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: kAddTaskView,
      builder: (context, state) => AddTaskView(),
    ),
    GoRoute(
      path: kDetailsView,
      builder: (context, state) => const DetailsView(),
    ),
    GoRoute(
      path: kSignInView,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: kSignUpView,
      builder: (context, state) => const SignUpView(),
    ),
  ]);
}
