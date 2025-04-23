import 'package:florida_rental_car/app/ui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoginTextFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const LoginTextFieldPassword({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
  });

  @override
  State<LoginTextFieldPassword> createState() => _LoginTextFieldPasswordState();
}

class _LoginTextFieldPasswordState extends State<LoginTextFieldPassword> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.labelText,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
        ),
        SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: OutlineInputBorder(
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
                _obscureText ? Icons.visibility : Icons.visibility_off,
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
              return 'Informe a senha.';
            }
            if (value.length < 6) {
              return 'A senha deve ter pelo menos 6 caracteres.';
            }
            return null;
          },
        )
      ],
    );
  }
}
