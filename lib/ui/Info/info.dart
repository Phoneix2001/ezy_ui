import 'package:data_table_2/data_table_2.dart' deferred as data_table;
import 'package:ezy_ui/model/data_user.dart' deferred as user_data;
import 'package:ezy_ui/model/user_info.dart' deferred as user_info;
import 'package:ezy_ui/ui/Info/function/data_source.dart'
    deferred as data_sources;
import 'package:ezy_ui/utils/local_storage/hive_db.dart';

import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        CircularProgressIndicator,
        ConnectionState,
        DataColumn,
        EdgeInsets,
        FutureBuilder,
        Padding,
        Scaffold,
        SizedBox,
        StatelessWidget,
        Text,
        Widget;

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: loadAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator()));
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: data_table.PaginatedDataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  rowsPerPage: 30,
                  minWidth: 1340,
                  renderEmptyRowsInTheEnd: false,
                  columns: [
                    data_table.DataColumn2(
                      label: const Text('Template name'),
                      size: data_table.ColumnSize.L,
                    ),
                    const DataColumn(
                      label: Text('Created at'),
                    ),
                    const DataColumn(
                      label: Text('Last updated at'),
                    ),
                    const DataColumn(
                      label: Text('Updated logs'),
                    ),
                    const DataColumn(
                      label: Text('Template data'),
                    ),
                    const DataColumn(
                      label: Text('Template id'),
                    ),
                    const DataColumn(
                      label: Text('Actions'),
                    ),
                  ],
                  source: data_sources.DessertDataSource(
                      context,
                      LocalDB.templatesKey ?? [])),
            );
          }),
    );
  }

  Future<void> loadAll() async {
    await data_sources.loadLibrary();
    await data_table.loadLibrary();
    await user_data.loadLibrary();
    await user_info.loadLibrary();
  }
}
