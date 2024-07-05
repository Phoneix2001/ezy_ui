import 'package:ezy_ui/model/component_details_data_model.dart';
import 'package:ezy_ui/model/data_user.dart';
import 'package:ezy_ui/utils/constants/app_enum.dart';
import 'package:ezy_ui/utils/wrapper_funcation/uuid_genrator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/custom_widget/custom_widget_bloc.dart';
import '../widget/custom_build_ui.dart';

class Playground extends StatelessWidget {
  const Playground({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double width = 390.0;
    double height = 844.0;
    final CustomWidgetBloc bloc = BlocProvider.of<CustomWidgetBloc>(context);

    return BlocBuilder<CustomWidgetBloc, CustomComponentState>(
      builder: (context, state) {
        List<ComponentDetailsDataModel> list = [];
        list = state.widgetList;
        return Row(
          children: [
            Center(
              child: Container(
                width: screenSize.width < width ? screenSize.width : width,
                height: screenSize.height < height ? screenSize.height : height,
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).canvasColor),
                  child: DragTarget<CustomComponent>(
                    hitTestBehavior: HitTestBehavior.deferToChild,
                    onAcceptWithDetails: (details) =>
                        onAccept(details, context, bloc),
                    builder: (context, candidateData, rejectedData) {
                      return const CustomBuildUI();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height:  screenSize.height < height ? screenSize.height : height,
              width: 100,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                return Text(list[index].type.name);
              },),
            )
          ],
        );
      },
    );
  }

  void onAccept(DragTargetDetails<CustomComponent> details,
      BuildContext context, CustomWidgetBloc bloc) {
    bloc.add(OnListOfDraggedWidget(

        customComponent: ComponentDetailsDataModel(
            id: generateUniqueId,
            color: Theme.of(context).secondaryHeaderColor,
            width: 1000,
            height: 100,
            type: details.data,
        text: (details.data == CustomComponent.text) ? TextEditingController(text: "Enter text") : null ,
      columnComponent: ColumnComponent(id: generateUniqueId),
itemsCount: bloc.state.widgetList.length + 1
    )));
  }
}
