import 'package:flutter/material.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ToDoTab extends StatefulWidget {
  const ToDoTab({super.key});

  @override
  State<ToDoTab> createState() => _ToDoTabState();
}

class _ToDoTabState extends State<ToDoTab> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;
    DateTime currentDate = DateTime.now();
    String dayOfMonth = DateFormat('dd').format(currentDate);
    String monthOfYear = DateFormat('MMMM').format(currentDate);
    String year = DateFormat('yyyy').format(currentDate);
    String dayOfWeek = DateFormat('EEEE').format(currentDate);

    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  dayOfMonth,
                  style: TextStyle(
                    color: themeData.textTheme.titleLarge?.color,
                    fontSize: 56,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      monthOfYear,
                      style: TextStyle(
                        color: themeData.textTheme.titleLarge?.color,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      year,
                      style: TextStyle(
                        color: themeData.textTheme.titleLarge?.color,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  dayOfWeek,
                  style: TextStyle(
                    color: themeData.textTheme.titleLarge?.color,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        )
      ],
    );
  }
}
