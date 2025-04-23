import 'package:florida_rental_car/app/data/auth/auth_service.dart';
import 'package:florida_rental_car/app/data/model/profile_model.dart';
import 'package:florida_rental_car/app/ui/core/constants/app_colors.dart';
import 'package:florida_rental_car/app/ui/core/widgets/is_loading_indicator.dart';
import 'package:florida_rental_car/app/ui/core/widgets/text_field_email.dart';
import 'package:florida_rental_car/app/ui/core/widgets/text_field_password.dart';
import 'package:florida_rental_car/app/ui/pages/sign-up/widgets/open_terms.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterPage2 extends StatefulWidget {
  final ProfileModel profileModel;
  const RegisterPage2({super.key, required this.profileModel});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _ativateFaceId = false;
  bool _isLoading = false;

  late AuthService _authService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authService = AuthService(Supabase.instance.client);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Participar',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Dados de login para a sua conta',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Preencha os campos a seguir para criar a sua conta Florida Rental Car',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 24),
                TextFieldEmail(
                  controller: _emailController,
                  labelText: 'E-mail',
                  hintText: 'Digite seu e-mail',
                ),
                const SizedBox(height: 24),
                TextFieldPassword(
                  controller: _passwordController,
                  labelText: "Senha",
                  hintText: "Digite sua senha",
                ),
                const SizedBox(height: 24),
                TextFieldPassword(
                  controller: _confirmPasswordController,
                  labelText: "Confirmar Senha",
                  hintText: "Digite novamente a senha informada",
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ATIVAR FACE ID',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Switch(
                      value: _ativateFaceId,
                      onChanged: (value) {
                        setState(() {
                          _ativateFaceId = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Divider(
                  color: AppColors.divider,
                  thickness: 1,
                ),
                SizedBox(height: 12),
                Text(
                  'Ao me inscrever, eu concordo com os Termos de Uso e com as Políticas de Privacidade da Florida Rental Car',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                OpenTerms(title: 'Termos de uso'),
                OpenTerms(title: 'Política de privacidade'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: _isLoading
              ? null
              : () async {
                  await _register(context);
                },
          child: _isLoading ? IsLoadingIndicator() : const Text('Cadastrar'),
        ),
      ),
    );
  }

  Future<void> _register(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      showError('As senhas não coincidem.');
      return;
    }

    if (!_formKey.currentState!.validate()) {
      showError('Preencha todos os campos corretamente.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _authService.signUpWithDetails(
        profile: widget.profileModel,
        email: email,
        password: password,
      );

      showSuccess('Cadastro realizado com sucesso!');
      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      showError('Erro: ${e.toString()}');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
}
