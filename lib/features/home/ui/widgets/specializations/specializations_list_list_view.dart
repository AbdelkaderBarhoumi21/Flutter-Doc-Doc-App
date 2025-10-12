import 'package:docdoc_app/features/home/data/models/specializations_response_model.dart';
import 'package:docdoc_app/features/home/logic/home_cubit.dart';
import 'package:docdoc_app/features/home/ui/widgets/specializations/specializations_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialtyListView extends StatefulWidget {
  final List<SpecializationsData?> specializationsDataList;
  const SpecialtyListView({super.key, required this.specializationsDataList});

  @override
  State<SpecialtyListView> createState() => _SpecialtyListViewState();
}

class _SpecialtyListViewState extends State<SpecialtyListView> {
  var selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                specializationsId: widget.specializationsDataList[index]?.id,
              );
            },
            child: SpecialityListViewItem(
              specializationsData: widget.specializationsDataList[index],
              itemIndex: index,
              selectedIndex: selectedSpecializationIndex,
            ),
          );
        },
      ),
    );
  }
}
