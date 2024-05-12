import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../view_job/view_job_screen.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({super.key});

  @override
  _JobListScreenState createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  List<Map<String, dynamic>> jobs = [
    {'title': 'Phát triển ứng dụng Flutter', 'status': 'Hoàn thành'},
    {'title': 'Kiểm tra tính năng mới', 'status': 'Đang tiến hành'},
    {'title': 'Họp dự án công nghệ', 'status': 'Chưa bắt đầu'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh Sách Công Việc'),
      ),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          var job = jobs[index];
          return Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text(job['title'], style: const TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: Row(
                children: [
                  const Icon(Icons.tab_rounded, size: 16,),
                  const SizedBox(
                    width: 7,
                  ),
                  Text('Trạng thái: ${job['status']}'),
                ],
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black54,
              ),
              onTap: () {
                Navigator.push(
                  context,PageTransition(type: PageTransitionType.leftToRight,duration: Duration(milliseconds:350), child: ViewJobScreen())
                );
              },
            ),
          );
        },
      ),
    );
  }
}
