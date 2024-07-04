import 'package:ezy_ui/model/component_details_data_model.dart';
import 'package:ezy_ui/model/template.dart';

import 'package:flutter/material.dart'
    show
        Color,
        CrossAxisAlignment,
        MainAxisAlignment,
        MainAxisSize,
        TextBaseline,
        TextDirection,
        TextEditingController,
        VerticalDirection,
        Widget,
        immutable;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'custom_widget_event.dart';
part 'custom_widget_state.dart';

class CustomWidgetBloc extends Bloc<CustomWidgetEvent, CustomComponentState> {
  CustomWidgetBloc() : super(const CustomComponentState([], "")) {
    on<OnValueChange>((event, emit) {
      if (state.data == "Name") {
        emit(state.copyWith(widgetList:  state.widgetList, data: "Hello"));
      } else {
        emit(state.copyWith(widgetList:  state.widgetList,data:  "Name"));
      }
    });
    on<OnListOfDraggedWidget>((event, emit) {
      emit(state.copyWith(
        widgetList:   [...state.widgetList, event.customComponent],data:  state.data));
    });

    on<OnSelectedWidgetClick>((event, emit) {
      final selectedDataModel =
          state.widgetList.firstWhere((element) => element.id == event.id);
      emit(state.copyWith(
        widgetList: state.widgetList,
        data: state.data,
        selectedID: event.id,
        selectedDataModel: selectedDataModel,
      ));
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
          if (event.mainAxisAlignment != null) {
            item.columnComponent?.mainAxisAlignment =
                event.mainAxisAlignment ?? MainAxisAlignment.start;
          }
          if (event.mainAxisSize != null) {
            item.columnComponent?.mainAxisSize =
                event.mainAxisSize ?? MainAxisSize.max;
          }
          if (event.crossAxisAlignment != null) {
            item.columnComponent?.crossAxisAlignment =
                event.crossAxisAlignment ?? CrossAxisAlignment.start;
          }
          if (event.verticalDirection != null) {
            item.columnComponent?.verticalDirection =
                event.verticalDirection ?? VerticalDirection.down;
          }
          if (event.textDirection != null) {
            item.columnComponent?.textDirection = event.textDirection;
          }
          if (event.textBaseline != null) {
            item.columnComponent?.textBaseline = event.textBaseline;
          }
          emit(state.copyWith(
              widgetList: stateValues.widgetList,
              data: stateValues.data,
              selectedID: stateValues.selectedID,
              selectedDataModel: stateValues.selectedDataModel));
        }
      }
    });
    on<OnSelectNavigationRail>((event, emit) {
      emit(state.copyWith(
          widgetList: state.widgetList,
          data: state.data,
          selectedID: state.selectedID,
          selectedDataModel: state.selectedDataModel,
          selectedTab: event.selectedTab));
    });
    on<CreateNewTemplateEvent>(
      (event, emit) {
        emit(state.copyWith(
            selectedTemplate: event.template,
            selectedTemplateId: event.templateId));
      },
    );
  }
}
