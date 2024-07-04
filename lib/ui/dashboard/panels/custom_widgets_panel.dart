import 'package:ezy_ui/utils/constants/strings/strings.dart'
    deferred as strings;
import 'package:flutter/material.dart'
    show BuildContext, Card, Center, CircularProgressIndicator, Color, Colors, Column, ConnectionState, Draggable, EdgeInsets, FutureBuilder, Padding, SizedBox, StatelessWidget, Text, Widget, Wrap;

import '../../../utils/constants/app_enum.dart';

class CustomWidgetsPanel extends StatelessWidget {
  const CustomWidgetsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: strings.loadLibrary(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator()));
          }
          final string = strings.Strings();
          final List<Widget> itemGrid = [
            Draggable<CustomComponent>(
              data: CustomComponent.box,
              childWhenDragging: containerCard(
                  context: context, strings: string, color: Colors.grey),
              feedback:
                  containerCard(context: context, strings: string, width: 300),
              child: containerCard(
                context: context,
                strings: string,
              ),
            ),
            Draggable<CustomComponent>(
              data: CustomComponent.column,
              childWhenDragging: containerCard(
                  context: context,
                  strings: string,
                  color: Colors.grey,
                  name: string.column),
              feedback: containerCard(
                  context: context,
                  strings: string,
                  width: 300,
                  name: string.column),
              child: containerCard(
                  context: context, strings: string, name: string.column),
            ),
            Draggable<CustomComponent>(
              data: CustomComponent.stack,
              childWhenDragging: containerCard(
                  context: context,
                  strings: string,
                  color: Colors.grey,
                  name: string.stack),
              feedback: containerCard(
                  context: context,
                  strings: string,
                  width: 300,
                  name: string.stack),
              child: containerCard(
                  context: context, strings: string, name: string.stack),
            ),
            Draggable<CustomComponent>(
              data: CustomComponent.text,
              childWhenDragging: containerCard(
                  context: context,
                  strings: string,
                  color: Colors.grey,
                  name: string.text),
              feedback: containerCard(
                  context: context,
                  strings: string,
                  width: 300,
                  name: string.text),
              child: containerCard(
                  context: context, strings: string, name: string.text),
            )
          ];
          return Wrap(children: itemGrid

              /*  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),*/
              );
        });
  }

  Widget containerCard(
      {required BuildContext context,
      required dynamic strings,
      double? height,
      double? width,
      String? name,
      Color? color}) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        elevation: 15,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [Text(name ?? strings.box)],
          ),
        ),
      ),
    );
  }
}
