import 'package:carousel_slider/carousel_slider.dart';
import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:florida_rental_car/app/ui/pages/reservation/widgets/option_cards.dart';
import 'package:flutter/material.dart';

class ReservationPage extends StatefulWidget {
  final List<String>? imageUrls;
  const ReservationPage({super.key, this.imageUrls});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Reserva',
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
                "Próximas reservas",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              // Image carousel with some text in it
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: widget.imageUrls!.map((url) {
                      return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        child: Image.asset(
                          url,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 16,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hyundai Tucson ou similares",
                            style:
                                Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          Text(
                            "Categoria SUV",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imageUrls!.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => setState(() {
                      _currentIndex = entry.key;
                    }),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == entry.key
                            ? AppColors.buttonBackground
                            : AppColors.unselectedIconColor,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Text(
                'Detalhes da reserva',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'O modelo, placa e localização exata do carro será disponibilizado 1 (uma) hora antes do horário do check-in.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Check-in',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          'Seg, Mar 23',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '10:00 AM',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      width: 1,
                      color: AppColors.dividerBar,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Check-out',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          'Seg, Mar 30',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '10:00 AM',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.secundaryIconColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Aeroporto de Orlando (MCO)',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              OptionCards(
                iconPath: "assets/imgs/icons/info.svg",
                text: "Instruções para check-in e check-out",
                onTap: () {},
              ),
              SizedBox(height: 8),
              OptionCards(
                iconPath: "assets/imgs/icons/chat.svg",
                text: "Está com alguma dúvida? Fale com a gente",
                onTap: () {},
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Alterar reserva",
                  style: TextStyle(
                    color: AppColors.secundaryIconColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
