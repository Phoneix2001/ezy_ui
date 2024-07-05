import 'package:flutter/material.dart' show BuildContext, Offset, PopupMenuEntry, RelativeRect, showMenu;

void showPopupMenu(Offset offset, BuildContext context,
    List<PopupMenuEntry<String>> lists) async {
  double left = offset.dx;
  double top = offset.dy;
  await showMenu(

    context: context,
    position: RelativeRect.fromLTRB(left, top, 0, 0),
    items: lists,
    elevation: 8.0,
  );}