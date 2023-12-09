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
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 35,
                ),
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
                Center(
                  child: Text(
                    dayOfWeek,
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Positioned(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RoundedContainer(),
                    RoundedContainer(),
                    RoundedContainer(),
                    RoundedContainer(),
                    RoundedContainer(),
                  ],
                ),
              ),
            ),
            const Spacer(),
            const Positioned(
              child: RoundedContainer(),
            )
          ],
        )
      ],
    );
  }
}

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double containerWidth = deviceWidth * 0.9;
    return Container(
      padding: const EdgeInsets.all(14),
      width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFFFFFF),
      ),
      child: const Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.add_rounded,
            size: 40,
            color: Color(0xFF745D79),
          ),
          SizedBox(width: 16),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter text...',
                hintStyle: TextStyle(color: Color(0xFFBFAEC4)),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: Color(0xFF735D78),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
