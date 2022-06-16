import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProjectDetailChart extends StatelessWidget {
  const ProjectDetailChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        fit: StackFit.loose,
        children: [
          PieChart(
            PieChartData(sections: [
              PieChartSectionData(
                value: 50,
                color: theme.primaryColor,
                showTitle: true,
                title: '50 hrs',
                titleStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              PieChartSectionData(
                value: 50,
                color: theme.primaryColorLight,
                showTitle: true,
                title: '50 hrs',
                titleStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '200hrs',
              style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
