part of 'custom_widget_bloc.dart';

@immutable
sealed class CustomWidgetState {
  const CustomWidgetState();
}

final class CustomWidgetInitial extends CustomWidgetState {
  final String data;
  const CustomWidgetInitial(this.data);
}

final class CustomComponentState extends CustomWidgetState {
  final List<ComponentDetailsDataModel> widgetList;
  final String data;
  final String? selectedID;
  final int? selectedTab;
  final ComponentDetailsDataModel? selectedDataModel;
  final Template? selectedTemplate;
  final String? selectedTemplateId;
  const CustomComponentState(
    this.widgetList,
    this.data, {
        this.selectedTemplateId,
    this.selectedDataModel,
    this.selectedID,
    this.selectedTab,
    this.selectedTemplate,

  });
  CustomComponentState copyWith({
    List<ComponentDetailsDataModel>? widgetList,
    String? data,
    String? selectedID,
    int? selectedTab,
    ComponentDetailsDataModel? selectedDataModel,
    Template? selectedTemplate,
    String? selectedTemplateId
  }) {
    return CustomComponentState(
        widgetList ?? this.widgetList, data ?? this.data,
        selectedID: selectedID ?? this.selectedID,
        selectedTab: selectedTab ?? this.selectedTab,
        selectedTemplate: selectedTemplate ?? this.selectedTemplate,
selectedTemplateId: selectedTemplateId ?? this.selectedTemplateId,
        selectedDataModel: selectedDataModel ?? this.selectedDataModel);
  }
}
