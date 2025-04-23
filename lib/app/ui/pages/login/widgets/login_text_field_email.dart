import 'package:florida_rental_car/app/ui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoginTextFieldEmail extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const LoginTextFieldEmail(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
        ),
        SizedBox(height: 4),
        TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: AppColors.textFieldBorder,
                width: 1.0,
              ),
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelSmall,
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Informe o e-mail.';
            }
            if (!value.contains('@')) return 'E-mail inválido.';
            return null;
          },
        ),
      ],
    );
  }
}
