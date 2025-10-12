import 'package:docdoc_app/core/networking/api_error_handler.dart';
import 'package:docdoc_app/core/networking/api_result.dart';
import 'package:docdoc_app/features/home/data/apis/home_api_service.dart';
import 'package:docdoc_app/features/home/data/models/specializations_response_model.dart';
///Repo rules is check api call from webserver result if Result 'error' or Result 'success' 
class HomeRepo {
  final HomeApiService homeApiService;

  HomeRepo(this.homeApiService);
  Future<ApiResult<SpecializationsResponseModel>> getSpecialization() async {
    try {
      final response = await homeApiService.getSpecialization();
      return ApiResult.success(response);
    } catch (error) {
      ///ApiErrorHandler.handle(error) because there we dont the error is error from client(connection timeout cancel )
      ///or error from the backend like status code error 422 or ...
      ///due to error returned it wil be handled by ApiErrorHandler
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
