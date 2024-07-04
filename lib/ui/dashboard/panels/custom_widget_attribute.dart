import 'package:ezy_ui/bloc/custom_widget/custom_widget_bloc.dart';
import 'package:ezy_ui/ui/dashboard/widget/attribute_dropdown.dart';
import 'package:ezy_ui/ui/dashboard/widget/incremental_textfield.dart';
import 'package:ezy_ui/utils/common_widget/primary_text_field.dart';
import 'package:ezy_ui/utils/constants/app_enum.dart';
import 'package:ezy_ui/utils/constants/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_service/app_color_picker_service.dart';

class CustomWidgetAttribute extends StatelessWidget {
  const CustomWidgetAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomWidgetBloc bloc = BlocProvider.of<CustomWidgetBloc>(context);
    final strings = Strings();
    return BlocBuilder<CustomWidgetBloc, CustomComponentState>(
        builder: (context, state) {
      if (bloc.state.selectedDataModel == null) {
        return const Center(child: Text("Select a Widget"));
      }

      final List<Widget> attributesList =
          addWidgetToAttribute(context, bloc, strings);
      return ListView(children: attributesList);
    });
  }

  List<Widget> addWidgetToAttribute(
      BuildContext context, CustomWidgetBloc bloc, Strings strings) {
    List<Widget> widgets = [];
    switch (bloc.state.selectedDataModel?.type) {
      case null:
        break;
      case CustomComponent.box:
        break;
      case CustomComponent.column:
        widgets = addColumn(context, bloc, strings);
        break;
      case CustomComponent.stack:
        break;
      case CustomComponent.text:
        widgets = [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: PrimaryTextField(
                keyboardType: TextInputType.text,
                hintText: strings.text,
                controller: bloc.state.selectedDataModel?.text ??
                    TextEditingController(),
                onChange: (p0) {
                  bloc.add(OnEditExistingModelEvent(
                      text: bloc.state.selectedDataModel?.text));
                }),
          )
        ];
        break;
    }
    if (bloc.state.selectedDataModel?.type == CustomComponent.column) {
      return widgets;
    }
    if (bloc.state.selectedDataModel?.type != CustomComponent.text) {
      widgets.addAll([
        IncrementalTextField(
          title: "Height",
          preSelected: bloc.state.selectedDataModel?.height,
          onEditingComplete: (p0) {
            bloc.add(OnEditExistingModelEvent(height: p0));
          },
        ),
        IncrementalTextField(
          title: "Width",
          preSelected: bloc.state.selectedDataModel?.width,
          onEditingComplete: (p0) {
            bloc.add(OnEditExistingModelEvent(width: p0));
          },
        ),
      ]);
    }
    widgets.add(SizedBox(
      child: InkWell(
        onTap: () async {
          final selectedColor = await showColorPicker(context,
              color: Theme.of(context).primaryColor);
          if (selectedColor == null) return;
          bloc.add(OnEditExistingModelEvent(color: selectedColor));
        },
        child: Container(
          height: 40,
          width: 10,
          decoration: BoxDecoration(color: bloc.state.selectedDataModel?.color),
          child: const Row(
            children: [
              Icon(Icons.colorize),
              Text("Select Color"),
            ],
          ),
        ),
      ),
    ));
    return widgets;
  }

  List<Widget> addColumn(
      BuildContext context, CustomWidgetBloc bloc, Strings strings) {
    return [
      AttributeDropdown<String>(
          label: "Main Axis Alignment",
          list: MainAxisAlignment.values.map((e) => e.name).toList(),
          value: bloc.state.selectedDataModel?.columnComponent
                  ?.mainAxisAlignment.name ??
              "start",
          onChanged: (p0) {
            bloc.add(OnEditExistingModelEvent(
                mainAxisAlignment: MainAxisAlignment.values
                    .firstWhere((element) => element.name == p0)));
          }),
      AttributeDropdown<String>(
          label: "Cross Axis Alignment",
          list: CrossAxisAlignment.values.map((e) => e.name).toList(),
          value: bloc.state.selectedDataModel?.columnComponent
                  ?.crossAxisAlignment.name ??
              "start",
          onChanged: (p0) {
            bloc.add(OnEditExistingModelEvent(
                crossAxisAlignment: CrossAxisAlignment.values
                    .firstWhere((element) => element.name == p0)));
          }),
      AttributeDropdown<String>(
        list: MainAxisSize.values.map((e) => e.name).toList(),
        value:
            bloc.state.selectedDataModel?.columnComponent?.mainAxisSize.name ??
                "max",
        onChanged: (p0) {
          bloc.add(OnEditExistingModelEvent(
              mainAxisSize: MainAxisSize.values
                  .firstWhere((element) => element.name == p0)));
        },
        label: 'Main Axis Size',
      ),
      AttributeDropdown<String>(
          label: "Vertical Direction",
          list: VerticalDirection.values.map((e) => e.name).toList(),
          value: bloc.state.selectedDataModel?.columnComponent
                  ?.verticalDirection.name ??
              VerticalDirection.down.name,
          onChanged: (p0) {
            bloc.add(OnEditExistingModelEvent(
                verticalDirection: VerticalDirection.values
                    .firstWhere((element) => element.name == p0)));
          }),
      AttributeDropdown<String>(
          label: "Text Direction",
          list: TextDirection.values.map((e) => e.name).toList(),
          value: bloc
              .state.selectedDataModel?.columnComponent?.textDirection?.name,
          hint: "Select Text Direction",
          onChanged: (p0) {
            bloc.add(OnEditExistingModelEvent(
                textDirection: TextDirection.values
                    .firstWhere((element) => element.name == p0)));
          }),
      AttributeDropdown<String>(
          label: "Text Base Line",
          list: TextBaseline.values.map((e) => e.name).toList(),
          hint: "Select Text Baseline",
          value:
              bloc.state.selectedDataModel?.columnComponent?.textBaseline?.name,
          onChanged: (p0) {
            bloc.add(OnEditExistingModelEvent(
                textBaseline: TextBaseline.values
                    .firstWhere((element) => element.name == p0)));
          })
    ];
  }
}
