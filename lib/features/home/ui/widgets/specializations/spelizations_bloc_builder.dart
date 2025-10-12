import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/features/home/logic/home_cubit.dart';
import 'package:docdoc_app/features/home/logic/home_state.dart';
import 'package:docdoc_app/features/home/ui/widgets/doctors/doctors_shimmer_loading.dart';
import 'package:docdoc_app/features/home/ui/widgets/specializations/specializations_list_list_view.dart';
import 'package:docdoc_app/features/home/ui/widgets/specializations/specializations_list_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

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
          specializationsSuccess: (specializationsDataList) {
            return setupSuccess(specializationsDataList);
          },
          specializationsError: (errorHandler) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(16),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(specializationsList) {
    return SpecialtyListView(
      specializationsDataList: specializationsList ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
