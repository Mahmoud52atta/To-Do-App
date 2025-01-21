import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/constant.dart';
import 'package:to_do_app/core/utils/app_routers.dart';
import 'package:to_do_app/core/utils/assets.dart';

class HomeTasksAppBar extends StatelessWidget {
  const HomeTasksAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: kPrimaryColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset(
              Assets.logo,
              // width: 50,
              // height: 50,
            ),
          ),
        ),
        const Spacer(
          flex: 10,
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouters.kProfilView);
          },
          child: Image.asset(
            Assets.profileImage,
            width: 25,
            height: 25,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Image.asset(
          Assets.logOut,
          width: 25,
          height: 25,
        ),
      ],
    );
  }
}
