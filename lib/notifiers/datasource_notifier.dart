import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_score/models/datasource.dart';

class DataSourceNotifier with ChangeNotifier {
  List<DataColumn> _listColumns = [];
  List<DataRow> _listRows = [];

  List<DataColumn> get columns => _listColumns;
  List<DataRow> get rows => _listRows;

  void addAGame() {}

  void setColumns() {
    _listColumns = const [
      DataColumn(
        label: Expanded(
          child: Text(
            'Nga',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'Dung',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'Loi',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'Loan',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'Tung',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'Duc',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
    ];
  }

  void setRows() {
    List<DataRow> list = [];
    List<DataCell> dataCell = [];
    for (var i = 0; i < _listColumns.length; i++) {
      dataCell.add(DataCell(Text(Random().nextInt(100).toString())));
    }

    for (var i = 0; i < 5; i++) {
      list.add(DataRow(
        cells: dataCell,
      ));
    }
    _listRows = list;
  }
}
