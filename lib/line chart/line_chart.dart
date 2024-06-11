import 'package:alpha_ui/line%20chart/line_chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data=LineData();
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
                aspectRatio: 16/10,
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(
                    handleBuiltInTouches: true,
                  ),
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      )
                    ),
                      topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          )
                      ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value,TitleMeta meta){
                          return data.bottomTitle[value.toInt()] !=null
                              ? SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              data.bottomTitle[value.toInt()].toString(),
                              style: TextStyle(
                                color: Color(0xff637085),
                                fontSize: 19,
                              ),
                            )
                          )
                              :const SizedBox();
                        },
                        interval: 1,
                        reservedSize: 40,
                      )
                    )
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      color: Color(0xffFF9640),
                      barWidth: 2.5,
                      belowBarData: BarAreaData(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFF9640).withOpacity(0.5),
                            Color(0xffFFFFFF),
                          ]
                        ),
                        show: true,
                      ),
                      dotData: FlDotData(show:false),
                      spots: data.spots,
                    )
                  ],
                  minX: 0,
                  maxX: 80,
                  minY: 10,
                  maxY: 80,
                )
              ),
            ),

          ],
        ),
    );
  }
}


