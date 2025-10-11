import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/themes/app_styles.dart';
import 'package:docdoc_app/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorsModel;
  const DoctorsListViewItem({super.key, required this.doctorsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0.sp),
            child: Image.asset(
              'assets/images/doctor_speciality.png',
              width: 110.w,
              height: 110.h,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsModel?.name ?? 'Dr. Randy Wigham',
                  style: AppTextStyles.font16DarkBlueBold,
                ),
                verticalSpace(5),
                Text(
                  '${doctorsModel?.degree} | ${doctorsModel?.phone}',
                  style: AppTextStyles.font12GreyMedium,
                ),

                verticalSpace(5),
                Text(
                  doctorsModel?.email ?? 'Randy Wigham@gmail.com',
                  style: AppTextStyles.font12GreyRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
