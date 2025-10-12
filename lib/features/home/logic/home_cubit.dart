import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/networking/api_error_handler.dart';
import 'package:docdoc_app/core/networking/api_result.dart';
import 'package:docdoc_app/features/home/data/repository/home_repo.dart';
import 'package:docdoc_app/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/specializations_response_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  List<SpecializationsData?>? specializationsList = [];
  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        specializationsList =
            specializationsResponseModel.specializationDataList ?? [];
        //getting the doctors list for the first specializations list by default
        getDoctorsList(specializationsId: 1);
        emit(HomeState.specializationsSuccess(specializationsList));
      },
      failure: (apiErrorModel) {
        emit(HomeState.specializationsError(apiErrorModel));
      },
    );
  }

  void getDoctorsList({required int? specializationsId}) async {
    List<Doctors?>? doctorsList = getDoctorsListBySpecializationId(
      specializationsId,
    );
    // if(doctorsList != null && doctorsList.isNotEmpty){}else{}
    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      //HomeState.doctorsError() error doctor is filtered from specialization list no need for error model
      emit(HomeState.doctorsError());
    }
  }

  /// returns the list of doctors based on the specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
