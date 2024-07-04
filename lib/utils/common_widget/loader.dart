import 'package:flutter/material.dart' show BuildContext, CircularProgressIndicator, SizedBox, StatelessWidget, Widget;

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 100,
        width: 100,
        child: CircularProgressIndicator());
  }
}
