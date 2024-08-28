import 'package:crowd_funding_sample_app/controller/chart_controller.dart';
import 'package:crowd_funding_sample_app/helper/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartController>(
      builder: (controller) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration:
                    BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Icon(Icons.shopping_bag, size: 80),
              ),
              SizedBox(height: 10),
              Text(
                'Keranjang belanjamu masih kosong nih, Pilih dulu produk kebutuhan kamu yuk!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[300]),
                    onPressed: () {showSnackBar(message: 'Under development');},
                    child: Text(
                      'Yuk Mulai Belanja',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(height: 100)
            ],
          ),
        );
      }
    );
  }
}
