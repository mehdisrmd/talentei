import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:talentei/cubit/image_state.dart';
import 'package:talentei/models/filterchip_model.dart';

class ImageCubit extends Cubit<ImageInitialState> {
  TextEditingController controller = TextEditingController();
  List<FilterChipModel> showList = [];
  ImageCubit() : super(ImageInitialState.defaultState());
  showListController(FilterChipModel filterChipModel, bool onSelected) {
    if (onSelected) {
      showList.add(filterChipModel);
    } else {
      showList.forEach((value) {
        if (value.label == filterChipModel.label) {
          showList.remove(value);
        }
      });
    }
    emit(state);
  }

  void toggleSituation(String label, int tabIndex) {
    List<FilterChipModel> current = [];
    if (tabIndex == 0) {
      current = state.weather;
    } else if (tabIndex == 1) {
      current = state.lightAngle;
    } else if (tabIndex == 2) {
      current = state.color;
    } else if (tabIndex == 3) {
      current = state.painter;
    }

    final updatedList = current.map((chip) {
      return chip.label == label
          ? chip.copyWith(isSelected: !chip.isSelected)
          : chip;
    }).toList();

    emit(
      state.copyWith(
        weather: tabIndex == 0 ? updatedList : state.weather,
        lightAngle: tabIndex == 1 ? updatedList : state.lightAngle,
        color: tabIndex == 2 ? updatedList : state.color,
        painter: tabIndex == 3 ? updatedList : state.painter,
      ),
    );
  }
}
