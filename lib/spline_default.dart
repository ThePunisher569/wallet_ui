/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

import 'models.dart';

class SplineDefault extends StatefulWidget {

  final List<ChartSampleData>? chartData;
  const SplineDefault({super.key, this.chartData});

  @override
  State<SplineDefault> createState() => _SplineDefaultState();
}

class _SplineDefaultState extends State<SplineDefault> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultSplineChart();
  }


  /// Returns the default spline chart.
  SfCartesianChart _buildDefaultSplineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 1),
        labelPlacement: LabelPlacement.onTicks,
        axisLine: AxisLine(width: 1),
      ),
      primaryYAxis: const NumericAxis(
        minimum: 200,
        maximum: 800,
        axisLine: AxisLine(width: 1),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        labelFormat: '{value}K',
        majorTickLines: MajorTickLines(size: 0),
      ),
      series: _getDefaultSplineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
      enableAxisAnimation: true,
    );
  }

  /// Returns the list of chart series which need to render on the spline chart.
  List<SplineSeries<ChartSampleData, String>> _getDefaultSplineSeries() {
    return <SplineSeries<ChartSampleData, String>>[
      SplineSeries<ChartSampleData, String>(
        dataSource: widget.chartData,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        markerSettings: const MarkerSettings(isVisible: true),
        name: 'Bitcoin',
        color: Colors.white,
        cardinalSplineTension: 1,
        splineType: SplineType.cardinal,
      ),
    ];
  }

  @override
  void dispose() {
    widget.chartData!.clear();
    super.dispose();
  }
}
