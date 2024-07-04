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

class CreateNewTemplateEvent extends CustomWidgetEvent {
  final String templateId;
final Template? template;
  CreateNewTemplateEvent( {required this.templateId,this.template});
}


class OnEditExistingModelEvent extends CustomWidgetEvent {
  final double? height;
  final double? width;
  final Color? color;
  final TextEditingController? text;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  OnEditExistingModelEvent( {this.textBaseline,this.textDirection,this.verticalDirection,this.crossAxisAlignment,this.mainAxisSize,this.mainAxisAlignment,this.text, this.height, this.width, this.color});
}
