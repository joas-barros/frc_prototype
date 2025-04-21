import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:flutter/material.dart';

class RegularTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const RegularTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: AppColors.textFieldBorderEnabled,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: AppColors.textFieldBorder,
                width: 1.0,
              ),
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}