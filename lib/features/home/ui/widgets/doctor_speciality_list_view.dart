import 'package:docdoc_app/features/home/data/models/specializations_response_model.dart';
import 'package:docdoc_app/features/home/ui/widgets/speciality_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialtyListView extends StatelessWidget {
  final List<SpecializationsData?> specializationsDataList;
  const DoctorsSpecialtyListView({
    super.key,
    required this.specializationsDataList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsDataList.length,
        itemBuilder: (context, index) {
          return DoctorsSpecialityListViewItem(
            specializationsData: specializationsDataList[index],
            itemIndex: index,
          );
        },
      ),
    );
  }
}
