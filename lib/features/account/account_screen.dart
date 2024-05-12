import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manage_work/ultils/palette.dart';
import 'package:manage_work/ultils/utils.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: mWidth,
                      height: 90,
                      color: Palette.mainColor,
                    ),
                    SizedBox(height: 80),
                  ],
                ),
                Positioned(
                  top:
                      40,
                  left: 0,
                  right: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: mWidth * 0.8,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 20),
                            CircleAvatar(
                              backgroundColor: Palette.mainColor,
                              backgroundImage: NetworkImage(linkImage),
                              radius: 30,
                            ),
                            SizedBox(width: 15),
                             Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: mWidth > 300 ? 177 : 100,
                                  child: const Text(
                                    'Nguyễn Văn Thành',
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 15),
                                SizedBox(
                                  width: mWidth > 300 ? 177 : 100,
                                  child: const Text('Mã nhân viên: NVT188',
                                  maxLines: 2,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Dự án', style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
            ),
            Container(
              width: mWidth,
              height: 45,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 1),
              padding: EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Row(
                children: [
                  Icon(Icons.update),
                  SizedBox(
                    width: 10,
                  ),
                  const Text('Số lượng dự án đang nhận'),
                ],
              ),
            ),
            Container(
              width: mWidth,
              height: 45,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 1),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.update),
                  SizedBox(
                    width: 10,
                  ),
                  const Text('Thông tin dự án 1'),
                ],
              ),
            ),
            Container(
              width: mWidth,
              height: 45,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 1),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  Icon(Icons.update),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Thông tin dự án 2'),
                ],
              ),
            ),
            Container(
              width: mWidth,
              height: 45,
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  )),
              child: Row(
                children: [
                  Icon(Icons.update),
                  SizedBox(
                    width: 10,
                  ),
                  const Text('Thông tin dự án 3'),
                ],
              ),
            ),
        
            ///-------------
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Cài đặt', style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
            ),
            Container(
              width: mWidth,
              height: 45,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 1),
              padding: EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: const Row(
                children: [
                  Icon(Icons.update),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Cài đặt tài khoản'),
                ],
              ),
            ),
            Container(
              width: mWidth,
              height: 45,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 1),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  Icon(Icons.update),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Sửa số liệu')
                ],
              ),
            ),
            Container(
              width: mWidth,
              height: 45,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 1),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  Icon(Icons.update),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Cài đặt theme'),
                ],
              ),
            ),
            Container(
              width: mWidth,
              height: 45,
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  )),
              child: const Row(
                children: [
                  Icon(Icons.update),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Cài đặt thông báo'),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text('Phiên bản ứng dụng: 1.2.1')
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){}, child: Text('Đăng Xuất'),),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
