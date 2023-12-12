import 'package:flutter/material.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class PomodoroInfo extends StatelessWidget {
  const PomodoroInfo({super.key});

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
                'The Pomodoro Technique',
                style: TextStyle(
                  color: themeData.textTheme.displayMedium?.color,
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'The Pomodoro Technique is a time management method that helps people stay focused and productive. It involves breaking your work into short, timed intervals called "Pomodoros" (Italian for tomatoes, named after the kitchen timer used by the technique\'s creator) followed by short breaks.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: themeData.textTheme.titleLarge?.color,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'How it Works',
                style: TextStyle(
                  color: themeData.textTheme.displayMedium?.color,
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Set a Timer (Pomodoro): ',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: 'Choose a task you want to work on.',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Work Intensely: ',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Set a timer for 25 minutes and work on that task with full concentration until the timer rings.',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Take a Short Break: ',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Take a 5-minute break to relax, stretch, or do something enjoyable.',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Repeat: ',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Repeat the process. After completing four Pomodoros, take a longer break of 15-30 minutes.',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'How it Helps',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: themeData.textTheme.displayMedium?.color,
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Boosts Focus: ',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text:
                        'The time limit helps maintain focus during work intervals, reducing distractions.',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Prevents Burnout: ',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Regular breaks prevent mental fatigue and burnout, keeping you refreshed.',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Enhances Productivity: ',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Breaking tasks into manageable chunks makes work more achievable.',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Improves Time Estimation: ',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text:
                        'With practice, you\'ll learn to estimate how many Pomodoros a task will take.',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Encourages Consistency: ',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text:
                        'It establishes a rhythm for work and breaks, creating a consistent workflow.',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: Text(
                  'Version 1.2.3',
                  style: TextStyle(
                    color: themeData.textTheme.displayMedium?.color,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
