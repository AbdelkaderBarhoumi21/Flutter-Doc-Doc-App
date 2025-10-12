import 'package:docdoc_app/core/helpers/app_shared_preferences_helper.dart';
import 'package:docdoc_app/core/helpers/constants.dart';
import 'package:docdoc_app/core/networking/api_result.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/features/login/data/models/login_request_body.dart';
import 'package:docdoc_app/features/login/data/models/login_response.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docdoc_app/features/login/data/repository/login_repo.dart';
import 'package:docdoc_app/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginState() async {
    emit(const LoginState.loginLoading());
    ApiResult<LoginResponse> response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.userData?.token ?? '');
        emit(LoginState.loginSuccess(loginResponse));
      },
      failure: (apiErrorModel) {
        emit(LoginState.loginError(apiErrorModel));
      },
    );
  }
}

Future<void> saveUserToken(String token) async {
  //save token to shared Preferences
  await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  DioFactory.setTokenIntoHeaderAfterLogin(token);
}
