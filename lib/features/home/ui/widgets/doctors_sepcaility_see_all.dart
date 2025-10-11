import 'package:docdoc_app/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpecialtySeeAll extends StatelessWidget {
  const DoctorsSpecialtySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Doctor Speciality', style: AppTextStyles.font18DarkBlueSemiBold),
        Spacer(),
        Text('See All', style: AppTextStyles.font12BlueRegular),
      ],
    );
  }
}
