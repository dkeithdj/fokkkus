import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            builder: (BuildContext context) {
              return SizedBox(
                height: 400,
                child: Column(
                  children: [
                    Row(children: [
                      GestureDetector(
                        onTap: () {
                          //insert function add button here
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('../lib/icons/add.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      )
                    ]),
                    const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text('FOCUS CATEGORIES',
                          style: TextStyle(
                              color: Color(0xFF735D78),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 90.0, right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('../lib/icons/close.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              );
            });
      },
      child: Container(
        width: 26,
        height: 26,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../lib/icons/category.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
