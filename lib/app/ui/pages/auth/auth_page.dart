import 'package:florida_rental_car/app/data/auth/auth_service.dart';
import 'package:florida_rental_car/app/ui/pages/home/home_page.dart';
import 'package:florida_rental_car/app/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  User? _user;
  late final AuthService authService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService = AuthService(Supabase.instance.client);
    _getAuth();
  }

  @override
  Widget build(BuildContext context) {
    return _user == null ? LoginPage() : HomePage();
  }

  Future<void> _getAuth() async {
    setState(() {
      _user = authService.getCurrentUser();
    });
    authService.authStateChanges().listen((event) {
      setState(() {
        _user = event.session?.user;
      });
    });
  }
}
