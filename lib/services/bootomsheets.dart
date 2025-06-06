import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talentei/cubit/image_cubit.dart';
import 'package:talentei/cubit/image_state.dart';
import 'package:talentei/models/filterchip_model.dart';

class BottomSheets {
  static void imageBottomSheet(context, ImageCubit imageCubit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF070707),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) {
        // Provide the existing cubit to the bottom sheet
        return BlocProvider.value(
          value: imageCubit,
          child: Builder(
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(
                  context,
                ).viewInsets, // Adjust for keyboard if needed
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'انتخاب سبک',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        alignment: WrapAlignment.center,
                        children: imageCubit.state.imageStyle
                            .map(
                              (d) => Container(
                                width: 90,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 35, 35, 37),
                                    borderRadius: BorderRadius.circular(5)),
                                child: GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.asset(
                                              d.link,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                12,
                                              ),
                                              bottomRight: Radius.circular(
                                                12,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            d.label,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(7)),
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        child: Center(
                          child: Text('تایید'),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  static void catBottomSheet(BuildContext context, ImageCubit imageCubit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: const Color(0xFF070707),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return BlocProvider.value(
          value: imageCubit,
          child: Builder(
            builder: (context) {
              return DefaultTabController(
                length: 4,
                initialIndex: 3,
                child: Column(
                  children: [
                    Container(
                      color: Colors.black,
                      child: const TabBar(
                        isScrollable: true,
                        labelColor: Color(0xFF2196F3),
                        unselectedLabelColor: Colors.white,
                        indicatorColor: Color(0xFF2196F3),
                        indicatorWeight: 2.5,
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: 'BBC',
                        ),
                        tabs: [
                          Tab(text: 'حال و هوا'),
                          Tab(text: 'زاویه و نور'),
                          Tab(text: 'رنگ'),
                          Tab(text: 'نقاش'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<ImageCubit, ImageState>(
                        builder: (context, state) {
                          if (state is ImageInitialState) {
                            return TabBarView(
                              children: [
                                filterWidget(imageCubit, state.weather, 0),
                                filterWidget(imageCubit, state.lightAngle, 1),
                                filterWidget(imageCubit, state.color, 2),
                                filterWidget(imageCubit, state.painter, 3),
                              ],
                            );
                          } else {
                            // Handle other states or show a fallback widget
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

Widget filterWidget(
    ImageCubit imageCubit, List<FilterChipModel> list, int tabIndex) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(12),
    child: Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: list.map((chip) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: FilterChip(
            avatar: chip.isSelected ? Icon(Icons.close) : null,
            label: Text(
              chip.label,
              style: TextStyle(
                color: chip.isSelected ? Colors.white : Colors.white70,
              ),
            ),
            selected: chip.isSelected,
            onSelected: (value) {
              imageCubit.toggleSituation(chip.label, tabIndex);
              imageCubit.showListController(chip, value);
            },
            backgroundColor: const Color(0xFF1E1E1E),
            selectedColor: const Color(0xFF0C4C8A),
            checkmarkColor: Colors.white,
            showCheckmark: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
