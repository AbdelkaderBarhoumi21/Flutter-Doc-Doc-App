import 'package:docdoc_app/core/networking/api_error_handler.dart';
import 'package:docdoc_app/core/networking/api_error_model.dart';
import 'package:docdoc_app/features/home/data/models/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _initial;

  // Specializations
  const factory HomeState.specializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess(
    List<SpecializationsData?>? specializationDataList,
  ) = SpecializationsSuccess;
  const factory HomeState.specializationsError(ApiErrorModel apiErrorModel) =
      SpecializationsError;

  //doctors
  const factory HomeState.doctorsSuccess(List<Doctors?>? doctorsList) =
      DoctorsSuccess;
  const factory HomeState.doctorsError() = DoctorsError;
}
