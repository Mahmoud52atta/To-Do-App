import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key, required this.items});
  final List<String> items;

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedExperienceLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          value: selectedExperienceLevel,
          hint: const Text('Choose experience Level'),
          items: widget.items
              .map(
                (level) => DropdownMenuItem<String>(
                  value: level,
                  child: Text(level),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedExperienceLevel = value;
            });
          },
        ),
      ],
    );
  }
}
