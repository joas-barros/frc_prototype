import 'package:florida_rental_car/app/data/auth/auth_service.dart';
import 'package:florida_rental_car/app/ui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  final AuthService authService = AuthService(Supabase.instance.client);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: AppColors.appBarBackground,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/imgs/icons/avatar.png'),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Olá, ${authService.getCurrentUser()?.userMetadata?['first_name'] ?? ''}",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              Text(
                "Boas vindas à Florida Rental Car",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.chat_bubble_outline_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            // Ação ao pressionar o botão de notificação
          },
        ),
        IconButton(
          icon: const Icon(Icons.logout, color: AppColors.buttonBackground),
          onPressed: () {
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
    );
  }
}