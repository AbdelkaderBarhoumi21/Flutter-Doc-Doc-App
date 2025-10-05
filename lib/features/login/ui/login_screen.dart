import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/themes/app_colors.dart';
import 'package:docdoc_app/core/themes/app_styles.dart';
import 'package:docdoc_app/core/widgets/app_text_button.dart';
import 'package:docdoc_app/core/widgets/app_text_form_field.dart';
import 'package:docdoc_app/features/login/ui/widgets/already_have_account.dart';
import 'package:docdoc_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: AppTextStyles.font24BlueBold),
                // SizedBox(height: 8.h),
                verticalSpace(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: AppTextStyles.font14GreyRegular,
                ),
                verticalSpace(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const AppTextFormField(hintText: 'Email'),
                      verticalSpace(18.h),
                      AppTextFormField(
                        hintText: 'Password',
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            color: AppColors.primaryColor,
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(24),
                Align(
                  //AlignmentDirectional => to dont make issue when use EN or AR language
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "Forget Password?",
                    style: AppTextStyles.font13BlueRegular,
                  ),
                ),
                verticalSpace(40),
                AppTextButton(
                  buttonText: "Login",
                  textStyle: AppTextStyles.font16WhiteSemiBold,
                  onPressed: () {},
                ),
                verticalSpace(40),
                const TermsAndConditionsText(),
                verticalSpace(20),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: const AlreadyHaveAccountText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
