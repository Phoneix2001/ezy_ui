part of 'custom_widget_bloc.dart';

@immutable
sealed class CustomWidgetEvent {}

class OnDragCustomWidget extends CustomWidgetEvent {
  final Widget dragWidgetType;

  OnDragCustomWidget({required this.dragWidgetType});
}

class OnValueChange extends CustomWidgetEvent {}

class OnListOfDraggedWidget extends CustomWidgetEvent {
  final ComponentDetailsDataModel customComponent;

  OnListOfDraggedWidget({required this.customComponent});
}

class OnSelectedWidgetClick extends CustomWidgetEvent {
  final String id;

  OnSelectedWidgetClick({required this.id});
}

class OnSelectNavigationRail extends CustomWidgetEvent {
 final int selectedTab;

 OnSelectNavigationRail({required this.selectedTab});
}

class OnEditExistingModelEvent extends CustomWidgetEvent {
  final double? height;
  final double? width;
  final Color? color;
  final TextEditingController? text;
  OnEditExistingModelEvent({this.text, this.height, this.width, this.color});
}
