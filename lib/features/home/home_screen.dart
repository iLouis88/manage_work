import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manage_work/ultils/palette.dart';
import 'package:page_transition/page_transition.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../ultils/utils.dart';
import '../../widgets/search_widget.dart';
import '../add_edit_job/add_edit_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../main_drawer/main_drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Palette.mainColor),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Palette.mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: TextField(
              controller: _controller,
              onTap: () {
                _controller.clear();
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white),
                suffixStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu Quản Lý',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.construction),
              title: Text('QL công trình'),
              onTap: () {
                // Xử lý khi tab 'QL công trình'
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.production_quantity_limits),
              title: Text('QL sản phẩm'),
              onTap: () {
                // Xử lý khi tab 'QL sản phẩm'
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('QL đơn hàng'),
              onTap: () {
                // Xử lý khi tab 'QL đơn hàng'
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('QL khách hàng'),
              onTap: () {
                // Xử lý khi tab 'QL khách hàng'
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contrast),
              title: Text('QL hợp đồng'),
              onTap: () {
                // Xử lý khi tab 'QL hợp đồng'
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('QL thu chi'),
              onTap: () {
                // Xử lý khi tab 'QL thu chi'
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text('QL phiếu nhập xuất kho'),
              onTap: () {
                // Xử lý khi tab 'QL phiếu nhập xuất kho'
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundImage: Image.network(linkImage).image,
                  ),
                  const Text('Xin Chào!\nLouis - NVT'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Palette.mainColor,
                    highlightColor: Palette.mainColor.withOpacity(0.2),
                    hoverColor: Palette.mainColor,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            child: AddEditJobScreen(),duration:  Duration(milliseconds:350),
                            type: PageTransitionType.leftToRight,
                          ));
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(right: 1),
                        width: mWidth * 0.3,
                        height: mHeight * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.all(8),
                                child: Image.network(
                                    'https://i.imgur.com/Lbk51Xl.png')),
                            const Text('Thêm công việc')
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Palette.mainColor,
                    highlightColor: Palette.mainColor.withOpacity(0.2),
                    hoverColor: Palette.mainColor,
                    onTap: () {
                      showTopSnackBar(
                        Overlay.of(context),
                        dismissType:  DismissType.onSwipe,
                        const CustomSnackBar.info(
                          message:
                              "Tính năng này đang được update, sử dụng sau bạn nhé :v",
                        ),
                      );
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 1, right: 1),
                        width: mWidth * 0.3,
                        height: mHeight * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 30,
                                width: 30,
                                margin: EdgeInsets.all(8),
                                child: Image.network(
                                    'https://i.imgur.com/LRWpdNQ.png')),
                            const Text('Cập nhật')
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Palette.mainColor,
                    highlightColor: Palette.mainColor.withOpacity(0.2),
                    hoverColor: Palette.mainColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: FeatureGridScreen(),
                          type: PageTransitionType.rightToLeftWithFade, duration:  Duration(milliseconds:350),
                        ),
                      );
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 1),
                        width: mWidth * 0.3,
                        height: mHeight * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.all(8),
                                child: Image.network(
                                    'https://i.imgur.com/63nMFJ5.png')),
                            const Text('Xem thêm')
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 600,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: DashboardScreen()),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: mWidth,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: const Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ứng dụng quản lý công việc',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
