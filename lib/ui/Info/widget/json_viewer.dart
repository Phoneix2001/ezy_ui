import 'dart:convert';

import 'package:ezy_ui/utils/routes/route_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show AppBar, BuildContext, Colors, EdgeInsets, Expanded, Icon, Icons, Padding, Scaffold, StatelessWidget, Widget;

import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:go_router/go_router.dart';

class JsonViewer extends StatelessWidget {
  final dynamic data;
  final String? templateName;
  const JsonViewer({super.key, this.data, required this.templateName});

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      Router.neglect(context, () => context.go(RouteConstant.info));
      return const Scaffold();
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
        body: Expanded(
            child: JsonView.map(
      {templateName ?? "Template_exp": jsonDecode(data)},
      theme: const JsonViewTheme(
        backgroundColor: Colors.transparent,
        separator: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(":"),
        ),
        openIcon: Icon(Icons.arrow_right,color: Colors.deepPurple),
        closeIcon: Icon(Icons.arrow_drop_down,color: Colors.deepPurple,)

      ),
    )));
    }
}
