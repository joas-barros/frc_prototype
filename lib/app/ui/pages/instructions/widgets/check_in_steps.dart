import 'package:florida_rental_car/app/ui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckInSteps extends StatelessWidget {
  final List<Map<String, String>> steps;
  const CheckInSteps({super.key, required this.steps});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.unselectedIconColor, width: 1),
        color: Colors.white,
      ),
      child: Column(
        children: List.generate(steps.length, (index) {
          final item = steps[index];
          final isLast = index == steps.length - 1;

          return Column(
            children: [
              ListTile(
                leading: SvgPicture.asset(
                  item['icon']!,
                  width: 24,
                  height: 24,
                  color: AppColors.secundaryIconColor,
                ),
                title: Text(item['text']!,
                    style: Theme.of(context).textTheme.bodyMedium),
                dense: true,
                visualDensity: VisualDensity.compact,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              ),
              if (!isLast)
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.unselectedIconColor,
                ),
            ],
          );
        }),
      ),
    );
  }
}
