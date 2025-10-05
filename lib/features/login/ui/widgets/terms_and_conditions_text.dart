import 'package:docdoc_app/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: AppTextStyles.font13GreyRegular,
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: AppTextStyles.font13DarkBlueMedium,
          ),
          TextSpan(
            text: ' and',
            style: AppTextStyles.font13GreyRegular.copyWith(height: 1.5),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: AppTextStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
