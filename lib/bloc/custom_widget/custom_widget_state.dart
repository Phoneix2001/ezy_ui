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
  final int? selectedTab ;
  final ComponentDetailsDataModel? selectedDataModel;
  const CustomComponentState(this.widgetList, this.data,  {this.selectedDataModel,this.selectedID,this.selectedTab});
}
