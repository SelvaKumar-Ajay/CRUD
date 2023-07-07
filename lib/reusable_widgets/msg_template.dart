import 'package:flutter/material.dart';
import 'package:tech_bumble/screens/delete_dialog.dart';

import '../palette/colors.dart';
import '../screens/edit_screen.dart';

class MessageTemplate extends StatelessWidget {
  final double height;
  final double width;
  final String name;
  final String id;

  const MessageTemplate(
      {super.key,
      required this.height,
      required this.width,
      required this.name,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height * 0.1,
              width: height * 0.1,
              decoration: BoxDecoration(
                  color: Palette.secondary,
                  borderRadius: BorderRadius.circular(height * 0.1)),
            ),
            SizedBox(
              width: width * 0.03,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      id,
                      style: TextStyle(
                        color: Palette.primary,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.01,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: Palette.secondary,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: width * 0.02),
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    decoration: BoxDecoration(
                      // color: Palette.primary,
                      borderRadius: BorderRadius.circular(height * 0.03),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          size: 12,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => EditDialog(
                              id: id,
                              name: name,
                            ),
                          );
                        },
                      ),
                      //  Text(
                      //   '2',
                      //   style: TextStyle(
                      //       fontSize: 10,
                      //       color: Palette.white,
                      //       fontWeight: FontWeight.bold),
                      // ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: width * 0.03,
                // ),
                SizedBox(
                  height: height * 0.03,
                  width: height * 0.03,
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => DeleteDialog(
                              id: id,
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 12,
                        )),
                  ),
                )
                // Text(
                //   '02.19 PM',
                //   style: TextStyle(
                //     fontSize: 10,
                //     color: Palette.secondary,
                //   ),
                // ),
              ],
            )
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Divider(
            color: Palette.secondary,
          ),
        )
      ],
    );
  }
}
