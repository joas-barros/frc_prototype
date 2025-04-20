import 'package:florida_rental_car/app/data/auth/auth_service.dart';
import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:florida_rental_car/app/ui/core/widgets/is_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscureText = true;

  bool _obscureTextConfirm = true;

  late final AuthService _authService;

  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authService = AuthService(Supabase.instance.client);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Criar nova senha',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            const Text(
              'Nova Senha',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _passwordController,
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
                hintText: 'Digite a sua nova senha',
                hintStyle: TextStyle(
                  color: AppColors.textFieldHintText,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Confirmar senha',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureTextConfirm,
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
                hintText: 'Digite novamente a senha informada',
                hintStyle: TextStyle(
                  color: AppColors.textFieldHintText,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
                suffixIcon: IconButton(
                  icon: Icon(_obscureTextConfirm
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _obscureTextConfirm = !_obscureTextConfirm;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: _isLoading ? null : () => _handleRequest(context),
          child: _isLoading ? IsLoadingIndicator() : const Text('Continuar'),
        ),
      ),
    );
  }

  void _handleRequest(BuildContext context) {
    if (_passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos obrigatórios.'),
        ),
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('As senhas não coincidem.'),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      _authService.resetPassword(_passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Senha alterada com sucesso!'),
        ),
      );
      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao alterar a senha: $e'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
