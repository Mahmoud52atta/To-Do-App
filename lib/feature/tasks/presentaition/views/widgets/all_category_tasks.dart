import 'package:flutter/material.dart';
import 'package:tasky_app/constant.dart';

class AllCategoryTasks extends StatefulWidget {
  const AllCategoryTasks({
    super.key,
  });

  @override
  State<AllCategoryTasks> createState() => _AllCategoryTasksState();
}

List<bool> isSelected = [true, false, false, false];

class _AllCategoryTasksState extends State<AllCategoryTasks> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ToggleButtons(
          borderWidth: 8,
          borderRadius: BorderRadius.circular(8),
          disabledColor: kSecondColor,
          isSelected: isSelected,
          // highlightColor: kSecondColor,
          splashColor: kPrimaryColor,
          selectedColor: Colors.white,
          fillColor: kPrimaryColor,
          color: Colors.black,
          borderColor: kSecondColor,
          selectedBorderColor: kPrimaryColor,
          onPressed: (index) {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                isSelected[i] = i == index;
              }
            });
          },
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("All"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Inprogress"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Waiting"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Finished"),
            ),
          ],
        )
        // Row(mainAxisSize: MainAxisSize.max, children: [
        //   ItemCategoryTask(text: 'All'),
        //   SizedBox(
        //     width: 8,
        //   ),
        //   ItemCategoryTask(text: 'Inprogress'),
        //   SizedBox(
        //     width: 8,
        //   ),
        //   ItemCategoryTask(
        //     text: 'Waiting',
        //   ),
        //   SizedBox(
        //     width: 8,
        //   ),
        //   ItemCategoryTask(text: 'Finished'),
        // ]),
        );
  }
}
