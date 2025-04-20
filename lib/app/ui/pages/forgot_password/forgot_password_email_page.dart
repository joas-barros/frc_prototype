import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:flutter/material.dart';

class ForgotPasswordEmailPage extends StatefulWidget {
  const ForgotPasswordEmailPage({super.key});

  @override
  State<ForgotPasswordEmailPage> createState() =>
      _ForgotPasswordEmailPageState();
}

class _ForgotPasswordEmailPageState extends State<ForgotPasswordEmailPage> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recuperar Senha',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 8,
            ),
            const Text(
              'Digite o e-mail utilizado em seu cadastro que te enviaremos um email com as instruções para criar uma nova senha.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'E-mail',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
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
                hintText: 'Digite o seu e-mail cadastrado',
                hintStyle: TextStyle(
                  color: AppColors.textFieldHintText,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {},
        child: const Text('Recuperar senha'),
      ),
    );
  }
}
