import 'package:crowd_funding_sample_app/controller/profile_controller.dart';
import 'package:crowd_funding_sample_app/helper/get_initial.dart';
import 'package:crowd_funding_sample_app/ui/profile_pages/personal_info/personal_info_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile-page';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileaController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text('Profile'),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[200],
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InfoLabelBuilder(controller: controller),
                  SizedBox(height: 10),
                  ListOfProfileMenuBuilder(list: controller.listOfProfileMenu)
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class InfoLabelBuilder extends StatelessWidget {
  final ProfileaController controller;
  const InfoLabelBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration:
                BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Text('${getInitials(controller.userModel?.fullName??'-')}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${controller.userModel?.fullName??'-'}', style: TextStyle( fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text('Already Login')
            ],
          )
        ],
      ),
    );
  }
}

class ListOfProfileMenuBuilder extends StatelessWidget {
  final List<ProfileMenu> list;
  const ListOfProfileMenuBuilder({super.key,required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        itemBuilder: (context, index) => ItemOfProfileMenuBuilder(item: list[index]));
  }
}

class ItemOfProfileMenuBuilder extends StatelessWidget {
  final ProfileMenu item;
  const ItemOfProfileMenuBuilder({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5)),
              alignment: Alignment.center,
              child: item.icon,
            ),
            SizedBox(width: 10),
            Expanded(child: Text(item.name))
          ],
        ),
      ),
    );
  }
}
