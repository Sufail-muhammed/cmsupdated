import 'package:flutter/material.dart';

class TabletsTable extends StatelessWidget {
  final int rowCount;
  final int columnCount;

  const TabletsTable({
    Key? key,
    required this.rowCount,
    required this.columnCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: List.generate(rowCount, (rowIndex) {
        return TableRow(
          children: List.generate(columnCount, (colIndex) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Cell $rowIndex:$colIndex'),
            );
          }),
        );
      }),
    );
  }
}
