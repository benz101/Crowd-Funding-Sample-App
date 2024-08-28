import 'package:crowd_funding_sample_app/controller/home_controller.dart';
import 'package:crowd_funding_sample_app/helper/currency_formatter.dart';
import 'package:crowd_funding_sample_app/helper/get_initial.dart';
import 'package:crowd_funding_sample_app/helper/get_time_of_day.dart';
import 'package:crowd_funding_sample_app/ui/authentication/login/login_page.dart';
import 'package:crowd_funding_sample_app/ui/profile_pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.orange[300],
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              
                  UserSectionBuilder(controller: controller),
              ContentSectionBuilder(controller: controller)
            ],
          ),
        ),
      );
    });
  }
}

class UserSectionBuilder extends StatelessWidget {
  final HomeController controller;
  const UserSectionBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         (controller.userModel?.alreadyLogin ?? false)?  Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getTimeOfDay, style: TextStyle(color: Colors.white)),
                SizedBox(width: 5),
                Text('${controller.userModel?.fullName??'-'}', style: TextStyle(color: Colors.white))
              ],
            ),
          )): Text(getTimeOfDay, style: TextStyle(color: Colors.white)),
        (controller.userModel?.alreadyLogin ?? false)?  Expanded(
              child: Container(
                color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.notifications_none_outlined),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => Get.toNamed(ProfilePage.routeName),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Text(
                      '${getInitials(controller.userModel?.fullName??'')}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          )):GestureDetector(
            onTap: () => Get.toNamed(LoginPage.routeName),
            child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
              color: Colors.grey, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Icon(Icons.person),
                  ),
          )
        ],
      ),
    );
  }
}

class ContentSectionBuilder extends StatelessWidget {
  final HomeController controller;
  const ContentSectionBuilder({super.key, required this.controller});

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
          ListOfFinancialProductsBuilder(
              list: controller.listOfFinancialProducts),
          SizedBox(height: 10),
          ListOfOptionCategoriesBuilder(list: controller.listOfOptionCategory),
          SizedBox(height: 10),
          ListOfWelnessBuilder(list: controller.listOfWellness)
        ],
      ),
    );
  }
}

class ListOfFinancialProductsBuilder extends StatelessWidget {
  final List<FinancialProduct> list;
  const ListOfFinancialProductsBuilder({super.key, required this.list});

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
            itemCount: list.length,
            itemBuilder: (context, index) =>
                ItemOfFinancialProduct(item: list[index]))
      ],
    );
  }
}

class ItemOfFinancialProduct extends StatelessWidget {
  final FinancialProduct item;
  const ItemOfFinancialProduct({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          item.icon,
          Text(
            item.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}

class ListOfOptionCategoriesBuilder extends StatelessWidget {
  final List<OptionCategory> list;
  const ListOfOptionCategoriesBuilder({super.key, required this.list});

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
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
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
            itemCount: list.length,
            itemBuilder: (context, index) =>
                ItemOfOptionCategory(item: list[index]))
      ],
    );
  }
}

class ItemOfOptionCategory extends StatelessWidget {
  final OptionCategory item;
  const ItemOfOptionCategory({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          item.icon,
          Text(
            item.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}

class ListOfWelnessBuilder extends StatelessWidget {
  final List<Wellness> list;
  const ListOfWelnessBuilder({super.key, required this.list});

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
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
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
            itemCount: list.length,
            itemBuilder: (context, index) => ItemOfWellness(item: list[index]))
      ],
    );
  }
}

class ItemOfWellness extends StatelessWidget {
  final Wellness item;
  const ItemOfWellness({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: item.icon,
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              Text(
                CurrencyFormatter.convertToIdr(item.price, 0),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
