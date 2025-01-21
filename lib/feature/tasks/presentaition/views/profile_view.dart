import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_app/core/utils/assets.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/widgets/prifile_item.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/widgets/profile_view_appbar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            ProfileViewAppBar(),
            SizedBox(
              height: 16,
            ),
            ProfileItem(title: 'Name', value: 'Islam Sayed'),
            SizedBox(height: 16),
            ProfileItem(
                title: 'Phone', value: '+20 123 456-7890', isCopyable: true),
            SizedBox(height: 16),
            ProfileItem(title: 'Level', value: 'Senior'),
            SizedBox(height: 16),
            ProfileItem(title: 'Years of Experience', value: '7 years'),
            SizedBox(height: 16),
            ProfileItem(title: 'Location', value: 'Fayyum, Egypt'),
          ],
        ),
      ),
    );
  }
}
