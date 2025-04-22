import 'package:florida_rental_car/app/data/model/profile_model.dart';
import 'package:florida_rental_car/app/ui/core/widgets/regular_text_field.dart';
import 'package:florida_rental_car/app/ui/pages/sign-up/register_page_2.dart';
import 'package:florida_rental_car/app/ui/pages/sign-up/widgets/phone_input_field.dart';
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

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
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
                  'Informações pessoais',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Insira seus dados exatamente como aparecem em seus documentos pessoais.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),
                RegularTextField(
                  controller: _nameController,
                  labelText: "Nome",
                  hintText: "Digite o seu nome",
                ),
                const SizedBox(height: 24),
                RegularTextField(
                  controller: _lastNameController,
                  labelText: "Sobrenome",
                  hintText: "Digite o seu sobrenome",
                ),
                SizedBox(height: 24),
                PhoneInputField(
                  controller: _phoneController,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () => _handleGoToNextPage(context),
          child: const Text('Continuar'),
        ),
      ),
    );
  }

  void _handleGoToNextPage(BuildContext context) {
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage2(profileModel: profile),
      ),
    );
  }
}
