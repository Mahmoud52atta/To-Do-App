import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:to_do_app/cashe/helper_cache.dart';
import 'package:to_do_app/core/utils/routers/app_routers.dart';
import 'package:to_do_app/core/utils/Api/dio_consumer.dart';
import 'package:to_do_app/feature/auth/presentation/mange/auth/auth_cubit.dart';
import 'package:to_do_app/feature/tasks/data/todo_servise.dart';
import 'package:to_do_app/feature/tasks/presentaition/manage/add_task/add_task_cubit.dart';
import 'package:to_do_app/repos/auth_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) =>
              AuthCubit(AuthRepo(apiConsumer: DioConsumer(dio: Dio()))),
        ),
        // أضف المزيد من الـ Cubits إذا لزم الأمر
      ],
      child: const TaskyApp(),
    ),
  );
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.router,
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
    );
  }
}
