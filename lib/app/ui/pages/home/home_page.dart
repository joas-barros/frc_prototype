import 'package:florida_rental_car/app/data/auth/auth_service.dart';
import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:florida_rental_car/app/ui/pages/home/widgets/custom_bottom_nav.dart';
import 'package:florida_rental_car/app/ui/pages/home/widgets/reservation_card.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Text(
                "Próximas reservas",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 12),
              // ReservationCard(
              //   imageUrls: [
              //     'https://example.com/image1.jpg',
              //     'https://example.com/image2.jpg',
              //     'https://example.com/image3.jpg',
              //   ],
              //   carName: 'Cadillac Escalade',
              //   category: 'Categoria Escalade',
              //   location: 'Aeroporto de Orlando (MCO)',
              //   checkInDate: 'Seg, Mar 23',
              //   checkOutDate: 'Ter, Mar 30',
              // ),
              ReservationCard()
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
