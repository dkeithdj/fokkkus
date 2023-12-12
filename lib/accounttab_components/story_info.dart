import 'package:flutter/material.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class StoryInfo extends StatelessWidget {
  const StoryInfo({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Story Behind KKK',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: themeData.textTheme.displayMedium?.color,
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'The Katipunan, or KKK, was a secret revolutionary society formed in 1892 by Andres Bonifacio with the goal of liberating the Philippines from Spanish colonial rule. It played a pivotal role in sparking the Philippine Revolution, culminating in the declaration of independence on June 12, 1898, and the subsequent Philippine-American War for full sovereignty.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: themeData.textTheme.titleLarge?.color,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
              ),
            ),
            const Spacer(),
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
    );
  }
}
