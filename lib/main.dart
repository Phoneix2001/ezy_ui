import 'dart:async' ;

import 'package:ezy_ui/bloc/custom_widget/custom_widget_bloc.dart';
import 'package:ezy_ui/utils/intialize_app/initialize_app.dart';
import 'package:ezy_ui/utils/routes/route_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cubit/increment_decrement_cubit.dart';

Future<void> main() async {

 await initializeApp();

  runApp(const MyApp());
}

final GlobalKey<ScaffoldMessengerState> snackBarKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp.router(
        title: 'EZY Ui',
        scaffoldMessengerKey: snackBarKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            appBarTheme: AppBarTheme(color: Colors.deepPurple.shade200)),
        routerConfig: router,
      ),
    );
  }
}

final providers = [
  BlocProvider<CustomWidgetBloc>(
    create: (BuildContext context) => CustomWidgetBloc(),
  ),
  BlocProvider<IncrementDecrementCubit>(
    create: (BuildContext context) => IncrementDecrementCubit(),
  ),
];
