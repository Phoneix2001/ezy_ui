import 'package:ezy_ui/model/template.dart';
import 'package:ezy_ui/utils/custom_funcation.dart';
import 'package:ezy_ui/utils/local_storage/hive_db.dart';
import 'package:ezy_ui/utils/wrapper_funcation/uuid_genrator.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Colors,
        EdgeInsets,
        ElevatedButton,
        Expanded,
        Icon,
        Icons,
        MainAxisSize,
        Padding,
        Row,
        Scaffold,
        SizedBox,
        StatelessWidget,
        Text,
        Theme,
        Widget;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/custom_widget/custom_widget_bloc.dart';
import '../../ui/dashboard/widget/app_navigator_rail.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final CustomWidgetBloc bloc = BlocProvider.of<CustomWidgetBloc>(context);
    return BlocBuilder<CustomWidgetBloc, CustomComponentState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Ezy UI",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
            centerTitle: true,
            actions: actions(context, bloc),
          ),
          body: Row(
            children: [
              const Expanded(flex: 1, child: AppNavigationRail()),
              Expanded(
                flex: 13,
                child: child,
              )
            ],
          ),
        );
      },
    );
  }

  List<Widget> actions(BuildContext context, CustomWidgetBloc bloc) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ElevatedButton(
          onPressed: () => bloc.state.selectedTemplateId == null
              ? createTemplate(bloc)
              : saveTemplate(bloc),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(bloc.state.selectedTemplateId == null
                  ? "Create Template"
                  : "Save"),
              const SizedBox(
                width: 10,
              ),
              Icon(bloc.state.selectedTemplateId == null
                  ? Icons.create
                  : Icons.save)
            ],
          ),
        ),
      )
    ];
  }

  createTemplate(CustomWidgetBloc bloc) {
    bloc.add(CreateNewTemplateEvent(templateId: generateUniqueId));
  }

  saveTemplate(CustomWidgetBloc bloc) {
    final localData = LocalDB.templatesKey;
    // final localItem = localData.contains(element)
    bool isFound = false;
    for (Template item in localData ?? []) {
      if (item.templateId == bloc.state.selectedTemplateId) {
        isFound = true;
        item = item.copyWith(
          updatedLogs: [DateTime.now().toString(), ...?item.updatedLogs],
          updatedAt: DateTime.now().toString(),
          templateData: bloc.state.widgetList,
        );
      }
    }
    if (!isFound) {
      localData?.add( Template(
          templateName: "Template $generateUniqueId",
          createdAt: DateTime.now().toString(),
          templateId: generateUniqueId,
          templateData: bloc.state.widgetList,
          updatedAt: DateTime.now().toString(),
          updatedLogs: [DateTime.now().toString()]));
    }
   LocalDB.templatesKey = localData;

    toastColor("Saved Successfully");
  }
}
