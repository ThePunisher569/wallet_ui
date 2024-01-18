import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
    final isMobile =
        getDeviceType(MediaQuery.sizeOf(context)) == DeviceScreenType.mobile;

    return Column(
      children: [
        // market title and filter
        Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Market Overview\n',
                style: widget.theme.textTheme.headlineMedium?.copyWith(
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
            Align(
              alignment: Alignment.bottomRight,
              child: DropdownButton<int>(
                value: dropdownValue,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                hint: Text(
                  dropdownValue.toString(),
                  textAlign: TextAlign.left,
                ),
                style: widget.theme.textTheme.labelLarge,
                alignment: Alignment.center,
                borderRadius: BorderRadius.circular(16),
                padding: const EdgeInsets.all(8.0),
                elevation: 16,
                iconSize: 32,
                dropdownColor: ethereumColor.shade900,
                focusColor: ethereumColor.shade900,
                enableFeedback: true,
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
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
              ),
            )
          ],
        ),

        const SizedBox(height: 32),
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
