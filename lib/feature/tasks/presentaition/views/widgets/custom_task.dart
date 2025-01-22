import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/assets.dart';

class CustomTask extends StatelessWidget {
  const CustomTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.iconTask,
          width: 64,
          height: 64,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 200,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    'Grocery Shopping App  ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                    // height: 40,
                    // width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffFFE4F2)),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Waiting',
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    )),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  Assets.point3,
                  width: 30,
                  height: 30,
                )
              ],
            ),
            const SizedBox(
                width: 270,
                child: Text(
                    overflow: TextOverflow.ellipsis,
                    'This application is designed for shape is controler')),
            Row(
              children: [
                Image.asset(
                  Assets.flag,
                  width: 15,
                  height: 15,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'medium',
                  style: TextStyle(color: Color(0xff5F33E1)),
                ),
                const SizedBox(
                  width: 125,
                ),
                const Text('3/11/2023')
              ],
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
