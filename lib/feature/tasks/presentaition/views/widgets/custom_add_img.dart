import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/core/utils/assets/assets.dart';

class CustomAddImage extends StatefulWidget {
  final Function(String) onImagePicked; // تمرير رابط الصورة إلى الخارج
  const CustomAddImage({super.key, required this.onImagePicked});

  @override
  State<CustomAddImage> createState() => _CustomAddImageState();
}

class _CustomAddImageState extends State<CustomAddImage> {
  String? _imagePath; // مسار الصورة المختارة

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path; // تحديث الصورة المختارة
      });
      widget.onImagePicked(_imagePath!); // إرسال الصورة إلى الخارج
    } else if (pickedFile == null) {
      setState(() {
        Image.asset(Assets.taskImage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _imagePath != null
            ? Image.file(
                File(_imagePath!),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              )
            : const Icon(Icons.image, size: 100, color: Colors.grey),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery), // فتح المعرض
              icon: const Icon(Icons.photo_library),
              label: const Text('Gallery'),
            ),
            const SizedBox(width: 10),
            OutlinedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera), // فتح الكاميرا
              icon: const Icon(Icons.camera_alt),
              label: const Text('Camera'),
            ),
          ],
        ),
      ],
    );
  }
}
