// ignore_for_file: prefer_const_constructors

import 'package:ezy_ui/ui/dashboard/panels/custom_widget_attribute.dart'
    deferred as attribute;
import 'package:ezy_ui/ui/dashboard/panels/custom_widgets_panel.dart'
    deferred as panel;
import 'package:ezy_ui/ui/dashboard/panels/playground.dart' deferred as play;
import 'package:ezy_ui/utils/common_widget/loader.dart';


import 'package:flutter/material.dart'
    show BuildContext, Center, ConnectionState, Container, Expanded, FutureBuilder, Row, Scaffold, StatelessWidget, Theme, Widget;

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: AppLoader());
          }
          return Scaffold(
            body: Row(
              children: [
                Expanded(flex: 3, child: panel.CustomWidgetsPanel()),
                Expanded(
                  flex: 8,
                  child: Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: play.Playground(),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: attribute.CustomWidgetAttribute(),
                ),
              ],
            ),
          );
        });
  }

  Future<void> loadAll() async {
    await play.loadLibrary();
    await attribute.loadLibrary();
    await panel.loadLibrary();
  }
}
