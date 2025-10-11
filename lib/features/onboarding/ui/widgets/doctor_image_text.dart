import 'package:docdoc_app/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SvgPicture.asset('assets/svgs/docdoc_logo_low_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              // Gradient stop values range from 0.0 (start) to 1.0 (end)
              // colors: [red, green, blue],
              // stops: [0.0, 0.5, 1.0],
              // 0 => 0.14 white, 0.14 => 0.4 white.withOpacity(0.0)
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.14, 0.4],
            ),
          ),
          child: Image.asset('assets/images/onboarding_doctor.png'),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Text(
            "Best Doctor \nAppointment App",
            textAlign: TextAlign.center,
            style: AppTextStyles.font32BlueBold.copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }
}
