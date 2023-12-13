import 'package:flutter/material.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class TeamInfo extends StatelessWidget {
  const TeamInfo({super.key});

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
              'Our Team',
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
            Text(
              'We are a tiny team consisting of two 3rd Year Computer Science students. We love to craft digital products that make people’s lives a bit better.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: themeData.textTheme.titleLarge?.color,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            Center(
                child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'lib/accounttab_components/images/den.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Denrei Keith De Jesus',
                  style: TextStyle(
                    color: themeData.textTheme.displayMedium?.color,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Full-stack Developer',
                  style: TextStyle(
                    color: themeData.textTheme.displayMedium?.color,
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'lib/accounttab_components/images/tep.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    'Stephanie Palero',
                    style: TextStyle(
                      color: themeData.textTheme.displayMedium?.color,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'PM & UI/UX Designer',
                    style: TextStyle(
                      color: themeData.textTheme.displayMedium?.color,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
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
