import 'package:docdoc_app/core/networking/api_result.dart';
import 'package:docdoc_app/features/sign_up/data/repository/sign_up_repo.dart';
import 'package:docdoc_app/features/sign_up/logic/sign_up_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/sign_up_request_body.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());
    final response = await _signupRepo.signUp(
      SignupRequestBody(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        password: passwordController.text.trim(),
        passwordConfirmation: passwordConfirmationController.text.trim(),
        gender: 0,
      ),
    );
    response.when(
      success: (signupResponse) {
        emit(SignupState.signupSuccess(signupResponse));
      },
      failure: (apiErrorModel) {
        emit(SignupState.signupError(apiErrorModel));
      },
    );
  }
}
