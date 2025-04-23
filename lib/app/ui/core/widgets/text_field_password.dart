import 'package:florida_rental_car/app/ui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const TextFieldPassword({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
  });

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.labelText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
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
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.labelSmall,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textFieldHintText,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Campo obrigatório';
            }
            if (value.length < 6) {
              return 'A senha deve ter no mínimo 6 caracteres.';
            }
            return null;
          },
        ),
      ],
    );
  }
}
