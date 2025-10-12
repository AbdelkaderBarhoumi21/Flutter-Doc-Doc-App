import 'package:docdoc_app/core/di/dependency_injection.dart';
import 'package:docdoc_app/core/helpers/app_shared_preferences_helper.dart';
import 'package:docdoc_app/core/helpers/constants.dart';
import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/routing/app_router.dart';
import 'package:docdoc_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
   await checkIfLoggedInUser();
  runApp(DocApp(appRouter: AppRouter()));
}

bool isLoggedInUser = false;
checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  // want a function to check if not not null and not empty so i added it in extension
  // if (userToken != null && userToken.isNotEmpty) {
  //   isLoggedInUser = true;
  // }else{
  //   isLoggedInUser = false;
  // }
  if (userToken.isNullOrEmpty()) {
    isLoggedInUser = false;
  } else {
    isLoggedInUser = true;
  }
}
