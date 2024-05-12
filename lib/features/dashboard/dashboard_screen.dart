import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.network('https://i.imgur.com/2Y8xtQl.png'),
                      ),
                      const SizedBox(width: 10,),
                      const Text('Tổng quan công việc', style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),),
                    ],
                  ),
                )),
           const SizedBox(
              height: 40,
            ),
            Expanded(
              flex: 4, // Cho biểu đồ tròn
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 1,
                  centerSpaceRadius: 0,

                  sections: showingSections(),
                ),
                swapAnimationDuration: Duration(milliseconds: 150), // Optional
                swapAnimationCurve: Curves.linear, // Optional
              ),
            ),
            Expanded(
              flex: 5, // Cho danh sách nhân viên và công việc của họ
              child: ListView.builder(
                itemCount: 3, // Số lượng nhân viên
                itemBuilder: (context, index) {
                  // Giả định danh sách nhân viên là A, B, C
                  String employee = String.fromCharCode('A'.codeUnitAt(0) + index);
                  return ListTile(
                    title: Text('Nhân viên $employee'),
                    subtitle: Text('Hoàn thành: 10, Chưa hoàn thành: 5, Quá hạn: 2'),
                  );
                },
              ),
            ),
          ],
        ),

    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 13.0;
      final radius = isTouched ? 130.0 : 120.0;
      switch (i) {
        case 0:
          return PieChartSectionData(

            color: Colors.green,
            value: 40,
            title: 'Hoàn thành',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.orange,
            value: 30,
            title: 'Chưa\n hoàn thành',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.red,
            value: 30,
            title: 'Quá hạn',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
