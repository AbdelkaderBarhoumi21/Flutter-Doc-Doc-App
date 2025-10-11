import 'package:docdoc_app/core/helpers/spacing.dart';
import 'package:docdoc_app/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:docdoc_app/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:docdoc_app/features/home/ui/widgets/doctors_list_view.dart';
import 'package:docdoc_app/features/home/ui/widgets/doctors_sepcaility_see_all.dart';
import 'package:docdoc_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //home Top Bar
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(24),
              const DoctorsSpecialtySeeAll(),
              verticalSpace(16),
              const DoctorsSpecialtyListView(),
              verticalSpace(24),
              const DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
