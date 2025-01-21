import 'package:flutter/material.dart';
import 'package:to_do_app/feature/splash/presentation/views/widget/start_view_body.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StartViewBody(),
    );
  }
}
