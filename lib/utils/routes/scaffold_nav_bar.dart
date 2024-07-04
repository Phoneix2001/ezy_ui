import 'package:flutter/material.dart' show AppBar, BuildContext, Colors, Expanded, Icon, IconButton, Icons, Row, Scaffold, StatelessWidget, Text, Theme, Widget;

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
        actions: const [
          // IconButton(
          //   icon: const Icon(Icons.table_chart_outlined, color: Colors.white),
          //   onPressed: () {},
          // )
        ],
      ),
      body: Row(
        children: [
          const Expanded(
              flex: 1,
              child: AppNavigationRail()),
          Expanded(
            flex: 13,
            child: child,
          )
        ],
      ),
    );
  }
}