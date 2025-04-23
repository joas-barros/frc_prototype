import 'package:florida_rental_car/app/ui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditReservationModal extends StatelessWidget {
  const EditReservationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Alterar reserva',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          _buildDivider(),
          ListTile(
            leading: SvgPicture.asset(
              "assets/imgs/icons/modal/calendar.svg",
              width: 24,
              height: 24,
              color: AppColors.primaryIconColor,
            ),
            title: Text(
              "Alterar datas e local",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: SvgPicture.asset(
              "assets/imgs/icons/arrow-right.svg",
              width: 24,
              height: 24,
              color: AppColors.secundaryIconColor,
            ),
            onTap: (){},
          ),
          _buildDivider(),
          ListTile(
            leading: SvgPicture.asset(
              "assets/imgs/icons/modal/adicional.svg",
              width: 24,
              height: 24,
              color: AppColors.primaryIconColor,
            ),
            title: Text(
              "Adicionais",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: SvgPicture.asset(
              "assets/imgs/icons/arrow-right.svg",
              width: 24,
              height: 24,
              color: AppColors.secundaryIconColor,
            ),
            onTap: (){},
          ),
          _buildDivider(),
          ListTile(
            leading: SvgPicture.asset(
              "assets/imgs/icons/modal/close-circle.svg",
              width: 24,
              height: 24,
              color: AppColors.secundaryIconColor,
            ),
            title: Text(
              "Cancelar reserva",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.secundaryIconColor,
              ),
            ),
            trailing: SvgPicture.asset(
              "assets/imgs/icons/arrow-right.svg",
              width: 24,
              height: 24,
              color: AppColors.secundaryIconColor,
            ),
            onTap: (){},
          ),
        ],
      ),
    );
  }

  Divider _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.unselectedIconColor,
    );
  }
}
