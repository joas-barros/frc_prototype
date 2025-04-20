import 'package:florida_rental_car/app/data/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AuthService authService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService = AuthService(Supabase.instance.client);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olá"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implement logout functionality here
              try {
                authService.logout();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro ao sair: $e')),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Bem-vindo ao Florida Rental Car! ${authService.getCurrentUser()?.userMetadata?['first_name']} ${authService.getCurrentUser()?.userMetadata?['last_name']}",
        ),
      ),
    );
  }
}
