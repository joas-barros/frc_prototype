import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:florida_rental_car/app/ui/core/app_routes.dart';
import 'package:florida_rental_car/app/ui/pages/auth/auth_page.dart';
import 'package:florida_rental_car/app/ui/pages/forgot_password/forgot_password_email_page.dart';
import 'package:florida_rental_car/app/ui/pages/forgot_password/forgot_password_message.dart';
import 'package:florida_rental_car/app/ui/pages/home/home_page.dart';
import 'package:florida_rental_car/app/ui/pages/login/login_page.dart';
import 'package:florida_rental_car/app/ui/pages/sign-up/register_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonBackground,
            foregroundColor: AppColors.buttonText,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ),
      //home: LoginPage(),
      routes: {
        AppRoutes.splash: (context) => AuthPage(),
        AppRoutes.login: (context) => LoginPage(),
        AppRoutes.home: (context) => HomePage(),
        AppRoutes.register: (context) => RegisterPage(),
        AppRoutes.forgotPasswordEmail: (context) => ForgotPasswordEmailPage(),
        AppRoutes.forgotPasswordMessage: (context) => ForgotPasswordMessage(),
      },
    );
  }
}
