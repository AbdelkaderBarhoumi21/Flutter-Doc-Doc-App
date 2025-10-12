import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/networking/api_error_model.dart';
import 'package:docdoc_app/core/routing/routes.dart';
import 'package:docdoc_app/core/themes/app_colors.dart';
import 'package:docdoc_app/core/themes/app_styles.dart';
import 'package:docdoc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      //Only execute the listener if the new state is Loading, Success or Error.
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        //whenOrNull one of the state or no one of state (null)
        state.whenOrNull(
          loginLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
            );
          },
          loginSuccess: (loginResponse) {
            context.pop(); //to dismiss showDialog in loading
            context.pushNamed(Routes.homeScreen);
          },
          loginError: (apiErrorModel) {
            setupErrorState(context, apiErrorModel);
          },
        );
      },

      //Creates a box that will become as small as its parent allows.
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    context.pop(); //to dismiss showDialog in loading
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(
          apiErrorModel.getAllErrorMessages(),
          style: AppTextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text("Got it", style: AppTextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}
