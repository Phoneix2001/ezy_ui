import 'package:ezy_ui/ui/Info/info.dart';
import 'package:ezy_ui/ui/Info/widget/json_viewer.dart';
import 'package:ezy_ui/ui/dashboard/dashboard.dart';
import 'package:ezy_ui/utils/routes/route_constant.dart';
import 'package:ezy_ui/utils/routes/scaffold_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: RouteConstant.playground,
  debugLogDiagnostics: true,
  routes: [
    /// Application shell
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
            path: RouteConstant.playground,
            builder: (BuildContext context, GoRouterState state) {
              return const Dashboard();
            }),
        GoRoute(
            path: RouteConstant.info,
            builder: (BuildContext context, GoRouterState state) {
              return const Info();
            }),
      ],
    ),
    GoRoute(path: RouteConstant.jsonView,
      name: RouteConstant.jsonViewNamed,
      builder: (context, state) {

        return JsonViewer(templateName: (state.extra as Map?)?["templateName"],data: (state.extra as Map?)?["rawData"]);
      },)
  ],
);
