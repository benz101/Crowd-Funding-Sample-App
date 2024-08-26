import 'package:flutter/material.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Keranjang'),
      ),
      body: Container(
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
              decoration: BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle
              ),
              alignment: Alignment.center,
              child: Icon(Icons.shopping_bag, size: 80),
            ),
            SizedBox(height: 10),
            Text('Keranjang belanjamu masih kosong nih, Pilih dulu produk kebutuhan kamu yuk!',textAlign: TextAlign.center ,style: TextStyle(fontSize: 18),),
             SizedBox(height: 10),
             Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[300]),
                onPressed: (){}, child: Text('Yuk Mulai Belanja', style: TextStyle(color: Colors.white),)),
             ),
             SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}