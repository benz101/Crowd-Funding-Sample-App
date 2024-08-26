import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.orange[300],
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              UserSectionBuilder(),
              ContentSectionBuilder()
            ],
          ),
        ),
      ),
    );
  }
}

class UserSectionBuilder extends StatelessWidget {
  const UserSectionBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Selamat Malam', style: TextStyle(color: Colors.white)),
                SizedBox(width: 5),
                Text('User Name', style: TextStyle(color: Colors.white))
              ],
            ),
          )),
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.notifications_none_outlined),
                SizedBox(width: 10),
                Container(
                  width: 40,
                  height: 40,
                  decoration:
                      BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Text(
                    'U',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class ContentSectionBuilder extends StatelessWidget {
  const ContentSectionBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(40))),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          ListOfFinancialProductsBuilder(),
          SizedBox(height: 10),
          ListOfOptionCategoriesBuilder(),
          SizedBox(height: 10),
          ListOfWelnessBuilder()
        ],
      ),
    );
  }
}

class ListOfFinancialProductsBuilder extends StatelessWidget {
  const ListOfFinancialProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Produk Keuangan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => ItemOfFinancialProduct())
      ],
    );
  }
}

class ItemOfFinancialProduct extends StatelessWidget {
  const ItemOfFinancialProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.access_alarms_rounded),
          Text(
            'Product Label',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class ListOfOptionCategoriesBuilder extends StatelessWidget {
  const ListOfOptionCategoriesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Text('Kategori Pilihan',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                Text(
                  'Wishlist',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(width: 8),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle),
                )
              ]),
            )
          ],
        ),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => ItemOfOptionCategory())
      ],
    );
  }
}

class ItemOfOptionCategory extends StatelessWidget {
  const ItemOfOptionCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.access_alarms_rounded),
          Text(
            'Category Label',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class ListOfWelnessBuilder extends StatelessWidget {
  const ListOfWelnessBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Text('Explore Wellness',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                Text(
                  'Terpopoler',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_drop_down_outlined)
              ]),
            )
          ],
        ),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => ItemOfWellness())
      ],
    );
  }
}

class ItemOfWellness extends StatelessWidget {
  const ItemOfWellness({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            color: Colors.grey[300],
          )),
          Text(
            'Wellness Label',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
