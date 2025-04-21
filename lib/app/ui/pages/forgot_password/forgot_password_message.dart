import 'package:florida_rental_car/app/data/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordMessage extends StatelessWidget {
  final String? email;

  final AuthService _authService = AuthService(Supabase.instance.client);

  ForgotPasswordMessage({super.key, this.email});

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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Text(
              'Link de redefinição enviado',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: [
                Text(
                  'Enviamos um email para você redefinir sua senha.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Para criar uma nova senha, clique no link do e-mail e insira uma nova senha.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Caso não tenha recebido o e-mail, verifique o seu lixo eletrônico ou clique abaixo para reenviar o email',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () => _handleRequestPasswordReset(context),
              child: Text("Reenviar e-mail"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Text("Entrar"),
        ),
      ),
    );
  }
  
  _handleRequestPasswordReset(BuildContext context) {
    if (email != null) {
      _authService.requestPasswordReset(email!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email reenviado com sucesso!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email não encontrado.'),
        ),
      );
    }
  }
}
