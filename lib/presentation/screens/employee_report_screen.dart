import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/themes/theme_service.dart';

class EmployeeReportScreen extends StatefulWidget {
  const EmployeeReportScreen({super.key});

  @override
  State<EmployeeReportScreen> createState() => _EmployeeReportScreenState();
}

class _EmployeeReportScreenState extends State<EmployeeReportScreen> {
  String selectedFilter = "Today";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Employee Report")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterChips(),
            const SizedBox(height: 16),
            _buildBarChart(),
            const SizedBox(height: 24),
            const Text("Absent Employee", style: ThemeService.titleMedium),
            const SizedBox(height: 12),
            _buildAbsentList(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ["Today", "This week", "This Month"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: filters
          .map(
            (filter) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: ChoiceChip(
                label: Text(
                  filter,
                  style: ThemeService.bodyMedium.copyWith(
                    color: selectedFilter == filter
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                selected: selectedFilter == filter,
                onSelected: (_) => setState(() => selectedFilter = filter),
                selectedColor: Colors.deepPurple,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildBarChart() {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                  return Text(days[value.toInt() % 7]);
                },
              ),
            ),
          ),
          barGroups: _sampleData(),
          gridData: FlGridData(show: false),
        ),
      ),
    );
  }

  List<BarChartGroupData> _sampleData() {
    return [
      _barGroup(0, 5, 2, 1),
      _barGroup(1, 6, 3, 1),
      _barGroup(2, 4, 4, 1),
      _barGroup(3, 7, 1, 2),
      _barGroup(4, 5, 5, 0),
      _barGroup(5, 3, 2, 3),
      _barGroup(6, 6, 2, 0),
    ];
  }

  BarChartGroupData _barGroup(
    int x,
    double absent,
    double ontime,
    double late,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: absent, color: Colors.black, width: 6),
        BarChartRodData(toY: ontime, color: Colors.blue, width: 6),
        BarChartRodData(toY: late, color: Colors.lightBlueAccent, width: 6),
      ],
    );
  }

  Widget _buildAbsentList() {
    final absentees = [
      {
        "name": "Bessie Cooper",
        "img": "https://i.pravatar.cc/150?img=4",
        "left": "2 left",
      },
      {
        "name": "Annette Black",
        "img": "https://i.pravatar.cc/150?img=5",
        "left": "1 left",
      },
      {
        "name": "Darrell Steward",
        "img": "https://i.pravatar.cc/150?img=6",
        "left": "0 left",
      },
    ];

    return Column(
      children: absentees.map((e) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(e['img']!),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  e['name']!,
                  style: ThemeService.bodyMedium.copyWith(
                    fontWeight: ThemeService.fontWeightW500,
                  ),
                ),
              ),
              Text(
                e['left']!,
                style: ThemeService.bodySmall.copyWith(color: Colors.grey),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
