import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/assets/assets.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime) onDatePicked; // تمرير التاريخ إلى الخارج
  const CustomDatePicker({super.key, required this.onDatePicked});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // لا يسمح بالتواريخ السابقة
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
      widget.onDatePicked(_selectedDate!); // تمرير التاريخ إلى الخارج
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
          hintText: _selectedDate != null
              ? _selectedDate!.toLocal().toString().split(' ')[0]
              : 'Choose due date...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: Image.asset(
            scale: 3.5,
            Assets.calenderImage,
            width: 10,
            height: 10,
          )),
      onTap: () => _pickDate(context),
    );
  }
}
