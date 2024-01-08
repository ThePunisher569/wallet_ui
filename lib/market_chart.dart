import 'package:flutter/material.dart';
import 'package:wallet_ui/spline_default.dart';

import 'constants.dart';

class MarketChart extends StatefulWidget {
  const MarketChart({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  State<MarketChart> createState() => _MarketChartState();
}

class _MarketChartState extends State<MarketChart> {
  var dropdownValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // market title and filter
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'Market Overview\n',
                style: widget.theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Prices value updates',
                    style: widget.theme.textTheme.labelLarge
                        ?.copyWith(color: Colors.white38),
                  )
                ],
              ),
            ),
            DropdownButton<int>(
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              hint: const Text(
                'Weekly (2020)',
                textAlign: TextAlign.left,
              ),
              style: widget.theme.textTheme.labelLarge,
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(16),
              padding: const EdgeInsets.all(8.0),
              elevation: 8,
              iconSize: 24,
              dropdownColor: ethereumColor.shade700,
              focusColor: ethereumColor.shade700,
              items: chartDataList.map(
                (e) {
                  final indexOfE = chartDataList.indexOf(e);

                  var title = switch (indexOfE) {
                    0 => 'Weekly (2020)',
                    1 => 'Monthly (2020)',
                    _ => 'Yearly (2020)',
                  };
                  return DropdownMenuItem(
                    value: indexOfE,
                    child: Text(title),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
            )
          ],
        ),

        gapV,
        // market chart
        SplineDefault(
          chartData: dropdownValue == 0
              ? weeklyChartData
              : dropdownValue == 1
                  ? monthlyCharData
                  : yearlyChartData,
        ),
      ],
    );
  }
}
