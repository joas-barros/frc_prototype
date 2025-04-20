import 'package:florida_rental_car/app/data/auth/auth_service.dart';
import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:florida_rental_car/app/ui/core/widgets/is_loading_indicator.dart';
import 'package:florida_rental_car/app/ui/pages/forgot_password/forgot_password_message.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordEmailPage extends StatefulWidget {
  const ForgotPasswordEmailPage({super.key});

  @override
  State<ForgotPasswordEmailPage> createState() =>
      _ForgotPasswordEmailPageState();
}

class _ForgotPasswordEmailPageState extends State<ForgotPasswordEmailPage> {
  final TextEditingController _emailController = TextEditingController();
  late final AuthService _authService;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _authService = AuthService(Supabase.instance.client);
    _authService.configDeepLink(context);
  }

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed:
              _isLoading ? null : () => _handleRequestPasswordReset(context),
          child: _isLoading ? IsLoadingIndicator() : Text('Recuperar senha'),
        ),
      ),
    );
  }

  void _handleRequestPasswordReset(BuildContext context) {
    String email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha o e-mail.'),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      _authService.requestPasswordReset(email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('E-mail de recuperação enviado!'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ForgotPasswordMessage(email: email,)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao enviar o e-mail: $e'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
