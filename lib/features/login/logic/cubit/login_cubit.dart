import 'package:docdoc_app/core/networking/api_result.dart';
import 'package:docdoc_app/features/login/data/models/login_request_body.dart';
import 'package:docdoc_app/features/login/data/models/login_response.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docdoc_app/features/login/data/repository/login_repo.dart';
import 'package:docdoc_app/features/login/logic/cubit/login_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    ApiResult<LoginResponse> response = await _loginRepo.login(
      loginRequestBody,
    );

    response.when(
      success: (loginResponse) async {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
