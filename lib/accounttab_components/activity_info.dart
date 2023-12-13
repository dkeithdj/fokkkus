import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/accounttab_components/graph/bar_data.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class UserActivity extends StatefulWidget {
  const UserActivity({super.key});

  @override
  State<UserActivity> createState() => _UserActivityState();
}

class _UserActivityState extends State<UserActivity> {
  //list of weekly values
  List<int> weeklySummary = [4, 2, 42, 10, 100, 88, 90];

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: themeData.colorScheme.background,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: themeData.textTheme.titleLarge?.color ??
                  const Color(0xFF2E232F),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'About FoKKKus',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: themeData.textTheme.titleLarge?.color,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 36),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: themeData.textTheme.displayMedium?.color,
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Today(),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Summary',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: themeData.textTheme.displayMedium?.color,
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Summary(),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Focus Time',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: themeData.textTheme.displayMedium?.color,
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                FocusStatistics(
                  weeklySummary: weeklySummary,
                ),
              ],
            ),
          ),
        ));
  }
}

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 70,
          width: deviceWidth,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: themeData.colorScheme.background,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Focus Time (min)',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: themeData.textTheme.displayMedium?.color,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '30',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: themeData.textTheme.displayMedium?.color,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 70,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeData.colorScheme.background,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Focus Count',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: themeData.textTheme.displayMedium?.color,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '2',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: themeData.textTheme.displayMedium?.color,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 70,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeData.colorScheme.background,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Tasks Completed',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: themeData.textTheme.displayMedium?.color,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '26',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: themeData.textTheme.displayMedium?.color,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Today extends StatelessWidget {
  const Today({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 70,
          width: deviceWidth,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: themeData.colorScheme.background,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Focus Time (min)',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: themeData.textTheme.displayMedium?.color,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '30',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: themeData.textTheme.displayMedium?.color,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 70,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeData.colorScheme.background,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Focus Count',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: themeData.textTheme.displayMedium?.color,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '2',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: themeData.textTheme.displayMedium?.color,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 70,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeData.colorScheme.background,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Tasks Completed',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: themeData.textTheme.displayMedium?.color,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '26',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: themeData.textTheme.displayMedium?.color,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FocusStatistics extends StatelessWidget {
  final List weeklySummary;
  const FocusStatistics({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunTime: weeklySummary[0],
        monTime: weeklySummary[1],
        tueTime: weeklySummary[2],
        wedTime: weeklySummary[3],
        thurTime: weeklySummary[4],
        friTime: weeklySummary[5],
        satTime: weeklySummary[6]);
    myBarData.initializeBarData();
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
            maxY: 100,
            minY: 0,
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true, getTitlesWidget: getBottomTitles)),
            ),
            barGroups: myBarData.barData
                .map((data) => BarChartGroupData(x: data.x, barRods: [
                      BarChartRodData(
                          toY: data.y.toDouble(),
                          color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .textTheme
                              .displayMedium
                              ?.color,
                          width: 25,
                          borderRadius: BorderRadius.circular(4),
                          backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            toY: 100,
                            color: Provider.of<ThemeProvider>(context)
                                .themeData
                                .colorScheme
                                .background,
                          ))
                    ]))
                .toList()),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'Sun',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'Mon',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'Tue',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'Wed',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'Thur',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'Fri',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'Sat',
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
