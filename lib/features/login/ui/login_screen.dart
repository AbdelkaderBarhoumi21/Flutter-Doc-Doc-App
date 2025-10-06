import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/core/routing/routes.dart';
import 'package:docdoc_app/core/themes/app_styles.dart';
import 'package:docdoc_app/core/widgets/app_text_button.dart';
import 'package:docdoc_app/features/login/data/models/login_request_body.dart';
import 'package:docdoc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc_app/features/login/ui/widgets/already_have_account.dart';
import 'package:docdoc_app/features/login/ui/widgets/email_and_password.dart';
import 'package:docdoc_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:docdoc_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Column(
                  children: [
                    const EmailAndPassword(),
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
                      onPressed: () {
                        validateLogin(context);
                      },
                    ),
                    verticalSpace(40),
                    const TermsAndConditionsText(),
                    verticalSpace(20),
                    const Align(
                      alignment: AlignmentDirectional.center,
                      child: const AlreadyHaveAccountText(),
                    ),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text.trim(),
          password: context.read<LoginCubit>().passwordController.text.trim(),
        ),
      );
    }
  }
}
