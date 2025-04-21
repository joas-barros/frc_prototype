import 'package:florida_rental_car/app/data/auth/auth_service.dart';
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
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Olá ${authService.getCurrentUser()?.userMetadata?['first_name']}"),
            Text(
              "Boas vindas à Florida Rental Car",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
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
    );
  }
}
