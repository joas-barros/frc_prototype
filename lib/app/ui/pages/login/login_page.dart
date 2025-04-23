import 'package:florida_rental_car/app/data/auth/auth_service.dart';
import 'package:florida_rental_car/app/ui/core/constants/app_colors.dart';
import 'package:florida_rental_car/app/ui/core/constants/app_routes.dart';
import 'package:florida_rental_car/app/ui/core/widgets/is_loading_indicator.dart';
import 'package:florida_rental_car/app/ui/pages/login/widgets/login_text_field_email.dart';
import 'package:florida_rental_car/app/ui/pages/login/widgets/login_text_field_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _keepMeLoggedIn = false;

  final _formKey = GlobalKey<FormState>();
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
      backgroundColor: AppColors.loginBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 64,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/imgs/logo.svg',
                    ),
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'assets/imgs/title.svg',
                    ),
                  ),
                  SizedBox(height: 32),
                  LoginTextFieldEmail(
                    controller: _emailController,
                    labelText: "E-mail",
                    hintText: "Digite seu e-mail",
                  ),
                  SizedBox(height: 16),
                  LoginTextFieldPassword(
                    controller: _passwordController,
                    labelText: "Senha",
                    hintText: "Digite a sua senha",
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: _keepMeLoggedIn,
                        onChanged: (value) {
                          setState(() {
                            _keepMeLoggedIn = value!;
                          });
                        },
                        activeColor: AppColors.buttonBackground,
                      ),
                      Text(
                        'Manter-me conectado',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.forgotPasswordEmail,
                        );
                      },
                      child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () async {
                            await _handleLogin(context);
                          },
                    child: _isLoading
                        ? IsLoadingIndicator()
                        : Text('Acessar conta'),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Não tem uma conta?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle register action
                          Navigator.pushNamed(context, AppRoutes.register);
                        },
                        child: Text(
                          'Registrar-se',
                          style: TextStyle(
                            color: AppColors.buttonBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _handleLogin(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, preencha todos os campos corretamente.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    setState(() {
      _isLoading = true;
    });
    try {
      await _authService.signIn(
        email,
        password,
      );
    } catch (e) {
      // Handle error (e.g., show a snackbar or dialog)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao fazer login: ${e.toString()}'),
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
