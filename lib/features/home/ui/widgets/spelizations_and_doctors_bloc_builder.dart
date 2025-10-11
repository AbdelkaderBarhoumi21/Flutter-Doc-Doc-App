import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/features/home/logic/home_cubit.dart';
import 'package:docdoc_app/features/home/logic/home_state.dart';
import 'package:docdoc_app/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:docdoc_app/features/home/ui/widgets/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsAndDoctorBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () {
            return setupLoading();
          },
          specializationsSuccess: (specializationsResponseModel) {
            var specializationsList =
                specializationsResponseModel.specializationDataList;
            return setupSuccess(specializationsList);
          },
          specializationsError: (errorHandler) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return SizedBox(child: CircularProgressIndicator());
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupSuccess(specializationsList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialtyListView(
            specializationsDataList: specializationsList ?? [],
          ),
          verticalSpace(24),
          DoctorsListView(doctorsList: specializationsList?[0]?.doctorsList),
        ],
      ),
    );
  }
}
