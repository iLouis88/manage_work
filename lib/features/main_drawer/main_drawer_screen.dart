import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FeatureGridScreen extends StatelessWidget {
  const FeatureGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh Sách Tính Năng"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 8.0,
        children: const [
          FeatureItem(
            icon: Icons.construction,
            title: "QL công trình",
          ),
          FeatureItem(
            icon: Icons.production_quantity_limits,
            title: "QL sản phẩm",
          ),
          FeatureItem(
            icon: Icons.shopping_cart,
            title: "QL đơn hàng",
          ),
          FeatureItem(
            icon: Icons.people,
            title: "QL khách hàng",
          ),
          FeatureItem(
            icon: Icons.contrast,
            title: "QL hợp đồng",
          ),
          FeatureItem(
            icon: Icons.money,
            title: "QL thu chi",
          ),
          FeatureItem(
            icon: Icons.store,
            title: "QL phiếu nhập xuất kho",
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
//  final VoidCallback onTap;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.title,
  });
  //  required this.onTap

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          showTopSnackBar(
            Overlay.of(context),
            dismissType:  DismissType.onSwipe,
            const CustomSnackBar.error(
                message: 'Tính năng này chưa được phát triển'),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 40.0),
              SizedBox(height: 15.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
