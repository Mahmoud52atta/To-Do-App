import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/assets/assets.dart';

class CustomQRCode extends StatelessWidget {
  const CustomQRCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'QR Code:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            Assets.imageQRCode,
            height: 150,
            width: 150,
          ),
        ),
      ],
    );
  }
}
