import 'package:flutter/material.dart';
import 'package:game_score/notifiers/datasource_notifier.dart';
import 'package:provider/provider.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  void initState() {
    super.initState();
    DataSourceNotifier dataSourceNotifier = Provider.of(context, listen: false);
    dataSourceNotifier.setColumns();
    dataSourceNotifier.setRows();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataSourceNotifier>(
      builder: (context, dataSource, child) => DataTable(
        columns: dataSource.columns,
        rows: dataSource.rows,
      ),
    );
  }
}
