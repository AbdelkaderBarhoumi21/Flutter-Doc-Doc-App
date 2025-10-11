import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
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
                        'Dr. Randy Wigham',
                        style: AppTextStyles.font16DarkBlueBold,
                      ),
                      verticalSpace(5),
                      Text(
                        'General | RSUD Gatot Subroto',
                        style: AppTextStyles.font12GreyMedium,
                      ),

                      verticalSpace(5),
                      Text(
                        'Randy Wigham@gmail.com',
                        style: AppTextStyles.font12GreyRegular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
