import 'package:flutter/material.dart';

import 'constants.dart';

class SellOrder extends StatefulWidget {
  const SellOrder({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  State<SellOrder> createState() => _SellOrderState();
}

class _SellOrderState extends State<SellOrder> {
  double elevation = 16;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() {
        elevation = 48;
      }),
      onExit: (event) => setState(() {
        elevation = 16;
      }),
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        shadowColor: elevation==48?ethereumColor:null,
        color: cardBgColor,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 24,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: cardBgColor,

            border: const Border(
              top: BorderSide(color: ethereumColor, width: 2),
              right: BorderSide(color: ethereumColor, width: 2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sell Order',
                    style: widget.theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  hamburgerMenuIcon
                ],
              ),
              const SizedBox(height: 16),
              const SellOrderTable()
            ],
          ),
        ),
      ),
    );
  }
}

class SellOrderTable extends StatefulWidget {
  const SellOrderTable({super.key});

  @override
  State<SellOrderTable> createState() => _SellOrderTableState();
}

class _SellOrderTableState extends State<SellOrderTable> {
  Color _getDataRowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.hovered,
    };

    if (states.any(interactiveStates.contains)) {
      return ethereumColor.shade800;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DataTable(
      dividerThickness: 0,
      dataRowColor: MaterialStateProperty.resolveWith(_getDataRowColor),
      showCheckboxColumn: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      dataTextStyle: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w300,
        color: Colors.white54,
      ),
      headingTextStyle: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      columns: const [
        DataColumn(
          numeric: true,
          label: Expanded(
            child: Text(
              'Price',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        DataColumn(
          numeric: true,
          label: Expanded(
            child: Text(
              'Amount',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Total',
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
      rows: coinListWeekly
          .map(
            (coin) => DataRow(
              onSelectChanged: (value) => debugPrint(value.toString()),
              cells: [
                DataCell(
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${coin.price}',
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                DataCell(
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${coin.amount}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '\$${coin.total}',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
