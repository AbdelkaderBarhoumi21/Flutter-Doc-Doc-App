import 'package:docdoc_app/core/networking/api_result.dart';
import 'package:docdoc_app/features/home/data/models/specializations_response_model.dart';
import 'package:docdoc_app/features/home/data/repository/home_repo.dart';
import 'package:docdoc_app/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  List<SpecializationsData?>? specializationsList = [];
  void getSpecializations() async {
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        emit(HomeState.specializationsSuccess(specializationsResponseModel));
      },
      failure: (error) {
        emit(HomeState.specializationsError(error));
      },
    );
  }
}
