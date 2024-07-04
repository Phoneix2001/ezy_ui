import 'package:ezy_ui/model/component_details_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'custom_widget_event.dart';
part 'custom_widget_state.dart';

class CustomWidgetBloc extends Bloc<CustomWidgetEvent, CustomComponentState> {
  CustomWidgetBloc() : super(const CustomComponentState([], "")) {
    on<OnValueChange>((event, emit) {
      if (state.data == "Name") {
        emit(CustomComponentState(state.widgetList, "Hello"));
      } else {
        emit(CustomComponentState(state.widgetList, "Name"));
      }
    });
    on<OnListOfDraggedWidget>((event, emit) {
      emit(CustomComponentState(
          [...state.widgetList, event.customComponent], state.data));
    });

    on<OnSelectedWidgetClick>((event, emit) {
      final selectedDataModel =
          state.widgetList.firstWhere((element) => element.id == event.id);
      emit(CustomComponentState(state.widgetList, state.data,
          selectedID: event.id, selectedDataModel: selectedDataModel));
    });
    on<OnEditExistingModelEvent>((event, emit) {
      CustomComponentState stateValues = state;

      for (var item in stateValues.widgetList) {
        if (item.id == stateValues.selectedID) {
          if (event.height != null) {
            item.height = event.height;
          }
          if (event.width != null) {
            item.width = event.width;
          }
          if (event.color != null) {
            item.color = event.color;
          }
          if (event.text != null) {
            item.text = event.text ?? TextEditingController();
          }
          emit(CustomComponentState(stateValues.widgetList, stateValues.data,
              selectedID: stateValues.selectedID,selectedDataModel: stateValues.selectedDataModel));
        }
      }
    });
    on<OnSelectNavigationRail>((event,emit){

      emit(CustomComponentState(state.widgetList, state.data,
          selectedID: state.selectedID, selectedDataModel: state.selectedDataModel,selectedTab: event.selectedTab));
    });
  }
}
