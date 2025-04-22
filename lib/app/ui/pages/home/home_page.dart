import 'package:florida_rental_car/app/ui/pages/home/widgets/custom_app_bar.dart';
import 'package:florida_rental_car/app/ui/pages/home/widgets/custom_bottom_nav.dart';
import 'package:florida_rental_car/app/ui/pages/home/widgets/reservation_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Próximas reservas",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 12),
              ReservationCard(
                imageUrls: [
                  "assets/imgs/cars/car1.png",
                  "assets/imgs/cars/cars2.jpeg",
                  "assets/imgs/cars/cars3.jpeg"
                ],
                isCheckInAvailable: true,
              ),
              SizedBox(height: 12),
              ReservationCard(
                imageUrls: [
                  "assets/imgs/cars/cars4.png",
                  "assets/imgs/cars/cars5.png",
                  "assets/imgs/cars/cars6.jpeg"
                ],
                isCheckInAvailable: false,
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
      extendBody: true,
    );
  }
}
