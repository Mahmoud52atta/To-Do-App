import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/constant.dart';
import 'package:to_do_app/core/utils/assets/assets.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/widgets/custom_qr_code.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/widgets/drop_down.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetailsView createState() => _DetailsView();
}

class _DetailsView extends State<DetailsView> {
  DateTime? _selectedDate;
  String _selectedStatus = 'Inprogress';
  String _selectedPriority = 'Medium Priority';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Image.asset(
            Assets.arowLeft,
            scale: 1.5,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Task Details',
          style: TextStyle(fontSize: 20),
        ),
        actions: const [
          DropMenu(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // شعار المهمة
              Center(
                child: Column(
                  children: [
                    Image.asset(Assets.detailsImage),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // عنوان المهمة
              const Text(
                'Grocery Shopping App',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // وصف المهمة
              const Text(
                'This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // تاريخ الانتهاء
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kSecondColor,
                ),
                width: double.infinity,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 6, top: 5),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'End Date',
                            style: TextStyle(fontSize: 10),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            child: Text(
                              _selectedDate == null
                                  ? 'Choose a date'
                                  : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Image.asset(
                          Assets.calenderImage,
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // حالة المهمة
              const SizedBox(width: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hoverColor: kPrimaryColor,
                  // fillColor: kSecondColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                // iconEnabledColor: kPrimaryColor,
                // dropdownColor: kSecondColor,
                // borderRadius: BorderRadius.circular(16),
                value: _selectedStatus,
                items: const [
                  DropdownMenuItem(
                      value: 'Inprogress', child: Text('Inprogress')),
                  DropdownMenuItem(
                      value: 'Completed', child: Text('Completed')),
                  DropdownMenuItem(value: 'Pending', child: Text('Pending')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value!;
                  });
                },
              ),
              const SizedBox(height: 20),

              // أولوية المهمة
              const SizedBox(width: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      scale: 3,
                      Assets.flag,
                      width: 5,
                      height: 5,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
                value: _selectedPriority,
                items: const [
                  DropdownMenuItem(
                      value: 'High Priority', child: Text('High Priority')),
                  DropdownMenuItem(
                      value: 'Medium Priority', child: Text('Medium Priority')),
                  DropdownMenuItem(
                      value: 'Low Priority', child: Text('Low Priority')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedPriority = value!;
                  });
                },
              ),
              const SizedBox(height: 20),

              // رمز QR
              const Center(
                child: CustomQRCode(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
