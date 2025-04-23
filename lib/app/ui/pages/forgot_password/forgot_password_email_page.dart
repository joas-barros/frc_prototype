import 'package:florida_rental_car/app/data/auth/auth_service.dart';
import 'package:florida_rental_car/app/ui/core/widgets/is_loading_indicator.dart';
import 'package:florida_rental_car/app/ui/core/widgets/text_field_email.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _authService = AuthService(Supabase.instance.client);
    _authService.configDeepLink(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recuperar Senha',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                'Digite o e-mail utilizado em seu cadastro que te enviaremos um email com as instruções para criar uma nova senha.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              TextFieldEmail(
                controller: _emailController,
                labelText: "E-mail",
                hintText: "Digite o seu e-mail cadastrado",
              )
            ],
          ),
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

    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos obrigatórios corretamente.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    String email = _emailController.text.trim();

    setState(() {
      _isLoading = true;
    });

    try {
      _authService.requestPasswordReset(email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('E-mail de recuperação enviado!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ForgotPasswordMessage(
                  email: email,
                )),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao enviar o e-mail: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
