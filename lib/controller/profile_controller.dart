import 'package:crowd_funding_sample_app/helper/box_names.dart';
import 'package:crowd_funding_sample_app/helper/show_snackbar.dart';
import 'package:crowd_funding_sample_app/model/local/user_model.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_alert_dialog.dart';
import 'package:crowd_funding_sample_app/service/hive_service.dart';
import 'package:crowd_funding_sample_app/ui/profile_pages/personal_info/personal_info_page.dart';
import 'package:crowd_funding_sample_app/ui/splashscreen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileaController extends GetxController {
  UserModel? userModel;
  List<ProfileMenu> listOfProfileMenu = [
    ProfileMenu(
        icon: Icon(Icons.person_2_outlined),
        name: 'Informasi Pribadi',
        onTap: () => Get.toNamed(PersonalInfoPage.routeName)),
    ProfileMenu(
        icon: Icon(Icons.newspaper_outlined),
        name: 'Syarat & Ketentuan',
        onTap: () {
          showSnackBar(message: 'Under Development');
        }),
    ProfileMenu(
        icon: Icon(Icons.chat_outlined),
        name: 'Bantuan',
        onTap: () {
          showSnackBar(message: 'Under Development');
        }),
    ProfileMenu(
        icon: Icon(Icons.privacy_tip_outlined),
        name: 'Syarat & Ketentuan',
        onTap: () {
          showSnackBar(message: 'Under Development');
        }),
    ProfileMenu(
        icon: Icon(Icons.info_outline),
        name: 'Kebijakan Privasi',
        onTap: () {
          showSnackBar(message: 'Under Development');
        }),
    ProfileMenu(
        icon: Icon(Icons.exit_to_app_outlined),
        name: 'Log Out',
        onTap: () {
          Get.dialog(
              barrierDismissible: false,
              PrimaryAlertDialog(
                  title: 'Message',
                  content: 'Apa kamu ingin keluar dari aplikasi ini?',
                  leftButtonText: 'Ya',
                  rightButtonText: 'Tidak',
                  leftButtonAction: () async {
                    UserModel? user =
                        await HIVEService<UserModel>(boxName: USER_DATA)
                            .get('user_data_id');
                    user!.alreadyLogin = false;
                    user.loginDateTime = null;
                    await HIVEService<UserModel>(boxName: USER_DATA)
                        .saveToObjectById('user_data_id', user);

                    Get.offAllNamed(SplashScreenPage.routeName);
                  },
                  rightButtonAction: () => Get.back()));
        }),
    ProfileMenu(
        icon: Icon(Icons.recycling_outlined),
        name: 'Hapus Akun',
        onTap: () async {
          Get.dialog(
              barrierDismissible: false,
              PrimaryAlertDialog(
                  title: 'Message',
                  content: 'Apa kamu ingin menghapus akunmu secara permanen?',
                  leftButtonText: 'Ya',
                  rightButtonText: 'Tidak',
                  leftButtonAction: () async {
                    await HIVEService<UserModel>(boxName: USER_DATA).clear();
                   Get.offAllNamed(SplashScreenPage.routeName);
                  },
                  rightButtonAction: () => Get.back()));
        })
  ];

  @override
  void onInit() async {
    userModel =
        await HIVEService<UserModel>(boxName: USER_DATA).get('user_data_id');
    update();
    super.onInit();
  }
}

class ProfileMenu {
  Widget icon;
  String name;
  Function() onTap;

  ProfileMenu({required this.icon, required this.name, required this.onTap});
}
