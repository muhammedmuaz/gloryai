import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late List<ChartData> _chartData;
  final Random _random = Random();
  final List<String> _months = ['September', 'October', 'November'];

  @override
  void initState() {
    super.initState();
    _generateData();
  }

  void _generateData() {
    _chartData = List.generate(30, (index) {
      final date = DateTime(2023, 9, 1).add(Duration(days: index));
      final monthIndex = date.month - 9;
      final monthName = _months[monthIndex];
      return ChartData(
        date,
        _random.nextDouble() * 100,
        monthName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Performance'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _generateData();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Month headings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _months.map((month) {
                return Chip(
                  label: Text(month),
                  backgroundColor: Colors.blue[50],
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Graph - Clean version with no labels
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SfCartesianChart(
                  // Remove all borders and backgrounds
                  plotAreaBorderWidth: 0,
                  margin: EdgeInsets.zero,
                  
                  // X Axis - completely hidden
                  primaryXAxis: DateTimeAxis(
                    isVisible: false,  // Hide entire x-axis
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  
                  // Y Axis - completely hidden
                  primaryYAxis: NumericAxis(
                    isVisible: false,  // Hide entire y-axis
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  
                  // Series configuration
                  series: <CartesianSeries<ChartData, DateTime>>[
                    LineSeries<ChartData, DateTime>(
                      dataSource: _chartData,
                      xValueMapper: (ChartData data, _) => data.date,
                      yValueMapper: (ChartData data, _) => data.value,
                      color: Colors.blue,
                      width: 10,
                      // Remove all markers
                      markerSettings: const MarkerSettings(isVisible: false),
                    ),
                  ],
                  
                  // Disable tooltip
                  tooltipBehavior: TooltipBehavior(enable: false),
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final DateTime date;
  final double value;
  final String month;

  ChartData(this.date, this.value, this.month);
}