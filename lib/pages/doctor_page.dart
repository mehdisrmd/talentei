import 'package:flutter/material.dart';
import 'package:talentei/utils/global_profile.dart';
import 'package:talentei/utils/golobal_appbar.dart';
import 'package:talentei/widgets/doctor_info/library.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppointmentType { online, phone, inPerson }

class DoctorProfilePage extends StatelessWidget {
  const DoctorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF8F9FA),
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 19),
            child: Column(
              children: [
                ProfileHeaderWidget(),
                const SizedBox(height: 27),
                ActionButtonsWidget(),
                SizedBox(
                  height: 10,
                ),
                AppointmentSectionWidget(),
                DoctorInfoSectionWidget(),
                LocationSectionWidget(),
                ReviewSectionWidget(),
                // CalenderSectionWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
