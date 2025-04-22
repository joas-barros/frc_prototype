import 'package:carousel_slider/carousel_slider.dart';
import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:florida_rental_car/app/ui/pages/reservation/reservation_page.dart';
import 'package:flutter/material.dart';

class ReservationCard extends StatefulWidget {
  final List<String> imageUrls;
  final bool isCheckInAvailable;

  const ReservationCard(
      {super.key, required this.imageUrls, required this.isCheckInAvailable});

  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReservationPage(
                imageUrls: widget.imageUrls,
              ),
            ));
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image carousel
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
                  items: widget.imageUrls.map((url) {
                    return ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(8)),
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
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.imageUrls.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? AppColors.buttonBackground
                              : Colors.white.withOpacity(0.7),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Cadillac Escalade',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Categoria Escalade',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Aeroporto de Orlando (MCO)',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Check-in',
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(
                            'Seg, Mar 23',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 1,
                        color: AppColors.dividerBar,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Check-out',
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(
                            'Sex, Mar 23',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  widget.isCheckInAvailable
                      ? ElevatedButton(
                          onPressed: () {},
                          child: const Text("Check-in disponível"))
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
