import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data_provider/data_provider.dart';
import '../palette/colors.dart';
import '../reusable_widgets/msg_template.dart';
import 'add_dialog.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.fetchData();

    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Palette.primary,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const PostDataDialog(),
            );
          },
          child: Icon(
            Icons.add,
            color: Palette.white,
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Palette.gradient1,
                Palette.gradient2,
              ])),
              height: height,
              width: width,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(height * 0.5),
                    // topLeft: Radius.circular(height * 0.03),
                  ),
                  // borderRadius: BorderRadius.circular(height * 0.5),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient:
                            LinearGradient(begin: Alignment.topCenter, colors: [
                      Palette.gradient1,
                      Palette.gradient2,
                    ])),
                    height: height * 0.6,
                    width: width,
                  )),
            ),
            Positioned(
              // top: height * 0.05,
              // bottom: height * 0.05,
              left: width * 0.1,
              right: width * 0.1,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.04),
                    child: Text(
                      "Messages",
                      style: TextStyle(
                        color: Palette.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.75,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.circular(width * 0.05)),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.10,
                          horizontal: width * 0.07,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: dataProvider.dataList.length,
                          itemBuilder: (context, index) => MessageTemplate(
                            id: dataProvider.dataList[index].id,
                            name: dataProvider.dataList[index].name,
                            height: height,
                            width: width,
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
