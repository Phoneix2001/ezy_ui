import 'dart:convert';

import 'package:ezy_ui/model/template.dart';
import 'package:ezy_ui/utils/local_storage/hive_db.dart';
import 'package:ezy_ui/utils/routes/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/custom_widget/custom_widget_bloc.dart';

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// The file was extracted from GitHub: https://github.com/flutter/gallery
// Changes and modifications by Maxim Saplin, 2021

/// Keeps track of selected rows, feed the data into DesertsDataSource
class RestorableDessertSelections extends RestorableProperty<Set<int>> {
  Set<int> _dessertSelections = {};

  /// Returns whether or not a dessert row is selected by index.
  bool isSelected(int index) => _dessertSelections.contains(index);

  /// Takes a list of [Dessert]s and saves the row indices of selected rows
  /// into a [Set].
  void setDessertSelections(List<Dessert> desserts) {
    final updatedSet = <int>{};
    for (var i = 0; i < desserts.length; i += 1) {
      var dessert = desserts[i];
      if (dessert.selected) {
        updatedSet.add(i);
      }
    }
    _dessertSelections = updatedSet;
    notifyListeners();
  }

  @override
  Set<int> createDefaultValue() => _dessertSelections;

  @override
  Set<int> fromPrimitives(Object? data) {
    final selectedItemIndices = data as List<dynamic>;
    _dessertSelections = {
      ...selectedItemIndices.map<int>((dynamic id) => id as int),
    };
    return _dessertSelections;
  }

  @override
  void initWithValue(Set<int> value) {
    _dessertSelections = value;
  }

  @override
  Object toPrimitives() => _dessertSelections.toList();
}

int _idCounter = 0;

/// Domain model entity
class Dessert {
  Dessert(
    this.name,
    this.calories,
    this.fat,
    this.carbs,
    this.protein,
    this.sodium,
    this.calcium,
    this.iron,
  );

  final int id = _idCounter++;

  final String name;
  final int calories;
  final double fat;
  final int carbs;
  final double protein;
  final int sodium;
  final int calcium;
  final int iron;
  bool selected = false;
}

/// Data source implementing standard Flutter's DataTableSource abstract class
/// which is part of DataTable and PaginatedDataTable synchronous data fecthin API.
/// This class uses static collection of deserts as a data store, projects it into
/// DataRows, keeps track of selected items, provides sprting capability
class DessertDataSource extends DataTableSource {
  DessertDataSource(this.context, this.templateData,
      [sortedByCalories = false,
      this.hasRowTaps = false,
      this.hasRowHeightOverrides = false,
      this.hasZebraStripes = false]) {
    if (sortedByCalories) {
      sort(true);
    }
  }

  final BuildContext context;
  final List<Template> templateData;
  // Add row tap handlers and show snackBar
  bool hasRowTaps = false;
  // Override height values for certain rows
  bool hasRowHeightOverrides = false;
  // Color each Row by index's parity
  bool hasZebraStripes = false;

  void sort<T>(bool ascending) {
    if (ascending) {
      templateData.sort((a, b) {
        final nameA = a.templateName ?? ''; // Use empty string for null names
        final nameB = b.templateName ?? ''; // Use empty string for null names
        return nameA.compareTo(nameB);
      });
    }
    templateData.sort((a, b) {
      final nameA = a.templateName ?? ''; // Use empty string for null names
      final nameB = b.templateName ?? ''; // Use empty string for null names
      return nameB.compareTo(nameA);
    });
    notifyListeners();
  }

  void updateSelectedDesserts(RestorableDessertSelections selectedRows) {
    _selectedCount = 0;
    for (var i = 0; i < templateData.length; i += 1) {
      var dessert = templateData[i];
      if (selectedRows.isSelected(i)) {
        dessert.selected = true;
        _selectedCount += 1;
      } else {
        dessert.selected = false;
      }
    }
    notifyListeners();
  }

  @override
  DataRow2 getRow(int index, [Color? color]) {
    assert(index >= 0);
    if (index >= templateData.length) throw 'index > _desserts.length';
    final userInfo = templateData[index];
    return DataRow2.byIndex(
      index: index,
      selected: userInfo.selected,
      color: color != null
          ? WidgetStateProperty.all(color)
          : (hasZebraStripes && index.isEven
              ? WidgetStateProperty.all(Theme.of(context).highlightColor)
              : null),
      onSelectChanged: (value) {
        if (userInfo.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          userInfo.selected = value;
          notifyListeners();
        }
      },
      onTap: hasRowTaps
          ? () =>
              _showSnackbar(context, 'Tapped on row ${userInfo.templateName}')
          : null,
      onDoubleTap: hasRowTaps
          ? () => _showSnackbar(
              context, 'Double Tapped on row ${userInfo.templateName}')
          : null,
      onLongPress: hasRowTaps
          ? () => _showSnackbar(
              context, 'Long pressed on row ${userInfo.templateName}')
          : null,
      onSecondaryTap: hasRowTaps
          ? () => _showSnackbar(
              context, 'Right clicked on row ${userInfo.templateName}')
          : null,
      onSecondaryTapDown: hasRowTaps
          ? (d) => _showSnackbar(
              context, 'Right button down on row ${userInfo.templateName}')
          : null,
      specificRowHeight: 100,
      cells: [
        DataCell(Text(userInfo.templateName ?? "")),
        DataCell(Text(userInfo.createdAt ?? ""), onTap: () {}),
        DataCell(Text(userInfo.updatedAt ?? "")),
        DataCell(Text('${userInfo.updatedLogs}')),
        DataCell(
          Text(
            userInfo.rawTemplateData.toString(),
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
          onTap: () {
            context.goNamed(RouteConstant.jsonViewNamed, extra: {
              "rawData": jsonEncode(userInfo.rawTemplateData),
              "templateName": userInfo.templateName
            });
          },
        ),
        DataCell(Text('${userInfo.templateId}')),
        DataCell(PopupMenuButton(
          icon: const Icon(Icons.more_horiz),
           onSelected: (value) {
             switch(value) {
               case 0:

                 break;
               case 1:
                 final CustomWidgetBloc bloc = BlocProvider.of<CustomWidgetBloc>(context);

                 final templates =  LocalDB.templatesKey;

                 break;
               default:
                 break;
             }
           },
           itemBuilder: (BuildContext context) {

             return <PopupMenuItem<int>>[
               const PopupMenuItem<int>(
                 value: 0,
                 child: Text(
                   "Edit"
                 ),
               ),

               const PopupMenuItem<int>(
                 value: 1,
                 child:
                 Text("Delete"),
               ),
             ];    },
        )),
      ],
    );
  }

  @override
  int get rowCount => templateData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void selectAll(bool? checked) {
    for (final dessert in templateData) {
      dessert.selected = checked ?? false;
    }
    _selectedCount = (checked ?? false) ? templateData.length : 0;
    notifyListeners();
  }
}

int _selectedCount = 0;

_showSnackbar(BuildContext context, String text, [Color? color]) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: color,
    duration: const Duration(seconds: 1),
    content: Text(text),
  ));
}
