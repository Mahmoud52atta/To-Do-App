import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/utils/app_routers.dart';
import 'package:to_do_app/core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  void navigateToHomeView() {
    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).go(AppRouters.kStartView);
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToHomeView();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            Assets.logo,
            height: 45,
          ),
        ),
      ],
    );
  }
}
