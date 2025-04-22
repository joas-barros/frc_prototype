import 'package:florida_rental_car/app/ui/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionCards extends StatelessWidget {
   final String iconPath;
  final String text;
  final VoidCallback onTap;

  const OptionCards({
    required this.iconPath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.unselectedIconColor, width: 1), 
      ),
      elevation: 0,
      child: ListTile(
        leading: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
          color: AppColors.primaryIconColor,
        ),
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: SvgPicture.asset(
          "assets/imgs/icons/arrow-right.svg",
          width: 24,
          height: 24,
          color: AppColors.secundaryIconColor,
        ),
        onTap: onTap,
      ),
    );
  }
}