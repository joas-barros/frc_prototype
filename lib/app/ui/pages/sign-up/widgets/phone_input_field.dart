import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneInputField extends StatelessWidget {

  final TextEditingController controller;
  const PhoneInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Telefone',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        IntlPhoneField(
          style: TextStyle(color: Colors.black),
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
            hintText: "Número de celular",
            hintStyle: Theme.of(context).textTheme.labelSmall,
          ),
          initialCountryCode: 'BR',
          onChanged: (phone) {
            final String phoneNumber = phone.completeNumber;
            controller.text = phoneNumber;
          },
        ),
      ],
    );;
  }
}