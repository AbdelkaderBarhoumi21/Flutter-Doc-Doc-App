import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/themes/app_colors.dart';
import 'package:docdoc_app/core/themes/app_styles.dart';
import 'package:docdoc_app/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int itemIndex;
  const DoctorsSpecialityListViewItem({
    super.key,
    required this.specializationsData,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 16.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.lightBlue,
            child: SvgPicture.asset(
              'assets/svgs/general_speciality.svg',
              width: 30.w,
              height: 30.h,
              fit: BoxFit.cover,
            ),
          ),
          verticalSpace(12),
          Text(
            specializationsData!.name ?? 'General',
            style: AppTextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
