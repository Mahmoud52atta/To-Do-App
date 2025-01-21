import 'package:flutter/material.dart';
import 'package:to_do_app/constant.dart';
import 'package:to_do_app/core/utils/assets.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Image.asset(Assets.art),
      
      const SizedBox(
        height: 24,
      ),
      const Text(
        'Task Management & ',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
      const Text(
        'To-Do List. ',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text(
        'This productive tool is designed to help ',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      const Text(
        'you better manage your task  ',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      const Text(
        'project-wise conveniently! ',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      const SizedBox(
        height: 37,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
              padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 15, horizontal: 60)),
              backgroundColor: WidgetStatePropertyAll(kPrimaryColor)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Let’s Start',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset('assets/images/Arrow - Left.png')
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
