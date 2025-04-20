import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:florida_rental_car/app/ui/core/app_routes.dart';
import 'package:florida_rental_car/app/ui/pages/login/login_page.dart';
import 'package:florida_rental_car/app/ui/pages/sign-up/register_page.dart';
import 'package:florida_rental_car/app/ui/pages/sign-up/register_page_2.dart';
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
        AppRoutes.splash: (context) => LoginPage(),
        AppRoutes.login: (context) => LoginPage(),
        AppRoutes.home: (context) => LoginPage(),
        AppRoutes.register: (context) => RegisterPage(),
        AppRoutes.register2: (context) => RegisterPage2(),
      },
    );
  }
}
