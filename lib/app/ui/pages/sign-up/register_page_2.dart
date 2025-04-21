import 'package:florida_rental_car/app/data/auth/auth_service.dart';
import 'package:florida_rental_car/app/data/model/profile_model.dart';
import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:florida_rental_car/app/ui/core/widgets/is_loading_indicator.dart';
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

  bool _obscureText = true;
  bool _obscureTextConfirm = true;
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
              Text(
                'E-mail',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              TextField(
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
                  hintText: 'Digite o seu melhor e-mail',
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Senha',
                style: Theme.of(context).textTheme.titleMedium,
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
                  hintText: 'Digite sua senha',
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
              ),
              const SizedBox(height: 24),
              Text(
                'Confirmar senha',
                style: Theme.of(context).textTheme.titleMedium,
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
                  hintText: 'Confirme sua senha',
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureTextConfirm
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.textFieldHintText,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureTextConfirm = !_obscureTextConfirm;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // opção de ativar face id
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
              InkWell(
                onTap: () {
                  // Open terms of use and privacy policy
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children:[
                      Text(
                        "Termos de uso",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Open privacy policy
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        "Política de privacidade",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
              ),
            ],
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

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      showError('Preencha todos os campos.');
      return;
    }

    if (password != confirmPassword) {
      showError('As senhas não coincidem.');
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
