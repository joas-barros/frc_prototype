import 'package:florida_rental_car/app/data/model/profile_model.dart';
import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:florida_rental_car/app/ui/pages/sign-up/register_page_2.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
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
                'Informações pessoais',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                'Insira seus dados exatamente como aparecem em seus documentos pessoais.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              Text(
                'Nome',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              TextField(
                controller: _nameController,
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
                  hintText: 'Digite seu nome',
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Sobrenome',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              TextField(
                controller: _lastNameController,
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
                  hintText: 'Digite o seu sobrenome',
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Telefone',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              TextField(
                controller: _phoneController,
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
                  hintText: 'Digite seu telefone',
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            if (_nameController.text.isEmpty ||
                _lastNameController.text.isEmpty ||
                _phoneController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Preencha todos os campos obrigatórios.'),
                ),
              );
              return;
            }
            final profile = ProfileModel(
              name: _nameController.text,
              lastName: _lastNameController.text,
              phoneNumber: _phoneController.text,
            );
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => RegisterPage2(profileModel: profile),
              ),
            );
          },
          child: const Text('Continuar'),
        ),
      ),
    );
  }
}
