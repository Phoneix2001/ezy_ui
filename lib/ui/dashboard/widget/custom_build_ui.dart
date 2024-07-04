import 'package:ezy_ui/bloc/custom_widget/custom_widget_bloc.dart';
import 'package:ezy_ui/utils/constants/app_enum.dart';
import 'package:ezy_ui/utils/constants/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/component_details_data_model.dart';

class CustomBuildUI extends StatelessWidget {
  const CustomBuildUI({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomWidgetBloc bloc = BlocProvider.of<CustomWidgetBloc>(context);
    final Strings strings = Strings();
    return Scaffold(body: BlocBuilder<CustomWidgetBloc, CustomComponentState>(
      builder: (context, state) {
        List<ComponentDetailsDataModel> list = [];
        list = List.from(state.widgetList);

        return buildRecursiveUi(context, bloc, list, 0, state, strings);
      },
    ));
  }

  void onTapContainer(CustomWidgetBloc bloc, BuildContext context,
      ComponentDetailsDataModel e) {
    debugPrint(e.type.toString());
    bloc.add(OnSelectedWidgetClick(id: e.id));
  }

  Widget buildRecursiveUi(
      BuildContext context,
      CustomWidgetBloc bloc,
      List<ComponentDetailsDataModel> list,
      int index,
      CustomComponentState state,
      Strings strings) {

    if (index >= list.length) {
      return const Center(child: Text("Drag your object here"));
    }
    ComponentDetailsDataModel e = list[index];

    switch (e.type) {
      case CustomComponent.box:
        return Container(
            height: e.height,
            width: e.width,
            decoration: BoxDecoration(
              color: e.color,
              border: e.id != state.selectedID
                  ? null
                  : Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
            ),
            child: InkWell(
              onTap: () => onTapContainer(bloc, context, e),
              child: buildRecursiveUi(
                  context, bloc, list, 0, state, strings),
            ));
      case CustomComponent.column:
        if (list.length > 1 ) {
        final  data = list.sublist(index + 1);
        e.columnComponent?.widgets = [...data.map((e) => buildRecursiveUi(context, bloc, [e], index, state, strings))];
        
        }
        return InkWell(
            onTap: () => onTapContainer(bloc, context, e),
            child: Column(
              mainAxisSize: e.columnComponent?.mainAxisSize ?? MainAxisSize.max,
              textDirection: e.columnComponent?.textDirection,
              crossAxisAlignment: e.columnComponent?.crossAxisAlignment ??
                  CrossAxisAlignment.center,
              mainAxisAlignment: e.columnComponent?.mainAxisAlignment ??
                  MainAxisAlignment.start,
              textBaseline: e.columnComponent?.textBaseline,
              verticalDirection: e.columnComponent?.verticalDirection ??
                  VerticalDirection.down,
              key: e.columnComponent?.key,
              children: e.columnComponent?.widgets.isEmpty ?? true ? [
                Text("Fdd")
              ] : e.columnComponent?.widgets ?? [],
            ));
      case CustomComponent.stack:
        return InkWell(
            onTap: () => onTapContainer(bloc, context, e),
            child: buildRecursiveUi(
                context, bloc, list, index + 1, state, strings));
      case CustomComponent.text:
        return InkWell(
            onTap: () => onTapContainer(bloc, context, e),
            child: Text(
              e.text?.text ?? strings.textHere,
              style: TextStyle(color: e.color),
            ));
    }
  }
}
