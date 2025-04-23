import 'package:florida_rental_car/app/ui/core/constants/app_routes.dart';
import 'package:florida_rental_car/app/ui/core/constants/app_theme.dart';
import 'package:florida_rental_car/app/ui/pages/auth/auth_page.dart';
import 'package:florida_rental_car/app/ui/pages/forgot_password/create_new_password.dart';
import 'package:florida_rental_car/app/ui/pages/forgot_password/forgot_password_email_page.dart';
import 'package:florida_rental_car/app/ui/pages/forgot_password/forgot_password_message.dart';
import 'package:florida_rental_car/app/ui/pages/home/home_page.dart';
import 'package:florida_rental_car/app/ui/pages/instructions/instructions_page.dart';
import 'package:florida_rental_car/app/ui/pages/login/login_page.dart';
import 'package:florida_rental_car/app/ui/pages/reservation/reservation_page.dart';
import 'package:florida_rental_car/app/ui/pages/sign-up/register_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      routes: {
        AppRoutes.splash: (context) => AuthPage(),
        AppRoutes.login: (context) => LoginPage(),
        AppRoutes.home: (context) => HomePage(),
        AppRoutes.register: (context) => RegisterPage(),
        AppRoutes.forgotPasswordEmail: (context) => ForgotPasswordEmailPage(),
        AppRoutes.forgotPasswordMessage: (context) => ForgotPasswordMessage(),
        AppRoutes.createNewPassword: (context) => CreateNewPassword(),
        AppRoutes.reservationDetails: (context) => ReservationPage(),
        AppRoutes.instructions: (context) => InstructionsPage(),
      },
    );
  }
}
