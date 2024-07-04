import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

Future<Color> showColorPicker(BuildContext context, {Color? color}) async {
  return await showColorPickerDialog(
      context, color ?? Theme.of(context).primaryColor,
      enableTonalPalette: true,
      enableShadesSelection: true,
      enableTooltips: true);
}
