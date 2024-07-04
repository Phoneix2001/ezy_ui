import 'package:ezy_ui/utils/local_storage/hive_db.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        Icon,
        Icons,
        NavigationRail,
        NavigationRailDestination,
        NavigationRailLabelType,
        Router,
        StatelessWidget,
        Text,
        Theme,
        Widget;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/custom_widget/custom_widget_bloc.dart';
import '../../../utils/routes/route_constant.dart';

List<Map<String, dynamic>> get listRail => [
      {"name": "Playground", "icon": Icons.play_arrow},
      {"name": "Information", "icon": Icons.info}
    ];

class AppNavigationRail extends StatelessWidget {
  const AppNavigationRail({
    super.key,
    this.onDestinationSelected,
  });

  final void Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final CustomWidgetBloc bloc = BlocProvider.of<CustomWidgetBloc>(context);
    calculatePath(context, bloc);
    return BlocBuilder<CustomWidgetBloc, CustomComponentState>(
      builder: (context, state) {
        return NavigationRail(
          selectedIndex: state.selectedTab ?? LocalDB.getSelectedHomeTab ?? 0,
          backgroundColor: Theme.of(context).primaryColor,
          onDestinationSelected: onDestinationSelected ??
              (int int) => onChange(int, bloc, context),
          // groupAlignment: -0.85,
          labelType: NavigationRailLabelType.all,
          destinations: listRail.map((d) {
            return NavigationRailDestination(
              icon: Icon(
                d["icon"],
                color: Colors.white,
              ),
              label: Text(
                d["name"],
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  void onChange(int value, CustomWidgetBloc bloc, BuildContext context) {
    LocalDB.setSelectedHomeTab = value;
    bloc.add(OnSelectNavigationRail(selectedTab: value));
    switch (value) {
      case 1:
        Router.neglect(context, () => context.go(RouteConstant.info));
        break;
      default:
        Router.neglect(context, () => context.go(RouteConstant.playground));
        break;
    }
  }

  void calculatePath(BuildContext context, CustomWidgetBloc bloc) {
    final String location = GoRouterState.of(context).uri.path;

    if (location.startsWith(RouteConstant.playground)) {
      LocalDB.setSelectedHomeTab = 0;
      bloc.add(OnSelectNavigationRail(selectedTab: 0));
    }
    if (location.startsWith(RouteConstant.info)) {
      LocalDB.setSelectedHomeTab = 1;
      bloc.add(OnSelectNavigationRail(selectedTab: 1));
    }
  }
}
