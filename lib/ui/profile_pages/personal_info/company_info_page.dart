import 'package:crowd_funding_sample_app/controller/personal_info_controller.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_alert_dialog.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_button.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_dropdown.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyInfoPage extends StatelessWidget {
  final PersonalInfoController controller;
  CompanyInfoPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            PrimaryTextFormField(
                label: 'NAMA USAHA / PERUSAHAAN',
                controller: controller.companyNameCtrl),
            SizedBox(height: 15),
            PrimaryTextFormField(
              label: 'ALAMAT USAHA / PERUSAHAAN',
              controller: controller.companyAddressCtrl,
            ),
            SizedBox(height: 15),
            PrimaryDropDown(
                label: 'JABATAN',
                value: controller.positionChoosed,
                items: controller.positionList,
                onChanged: (v) {
                  controller.positionChoosed = v as String;
                  controller.update();
                }),
            SizedBox(height: 15),
            PrimaryDropDown(
                label: 'LAMA BEKERJA',
                value: controller.workDurationChoosed,
                items: controller.workDurationList,
                onChanged: (v) {
                  controller.workDurationChoosed = v as String;
                  controller.update();
                }),
            SizedBox(height: 15),
            PrimaryDropDown(
                label: 'SUMBER PENDAPATAN',
                value: controller.incomeSourceChoosed,
                items: controller.incomeSourceList,
                onChanged: (v) {
                  controller.incomeSourceChoosed = v as String;
                  controller.update();
                }),
            SizedBox(height: 15),
            PrimaryDropDown(
                label: 'PENDAPATAN KOTOR PERTAHUN',
                value: controller.brutoIncomePerYearChoosed,
                items: controller.brutoIncomePerYearList,
                onChanged: (v) {
                  controller.brutoIncomePerYearChoosed = v as String;
                  controller.update();
                }),
            SizedBox(height: 15),
            PrimaryDropDown(
                label: 'NAMA BANK',
                value: controller.bankChoosed,
                items: controller.banksList,
                onChanged: (v) {
                  debugPrint('bank choosed: $v');
                  controller.bankChoosed = v as String;
                  controller.update();
                }),
            SizedBox(height: 15),
            PrimaryTextFormField(
              label: 'NOMOR REKENING',
              controller: controller.accountNumberCtrl,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),
            PrimaryTextFormField(
                label: 'CABANG BANK', controller: controller.bankBranchCtrl),
            SizedBox(height: 15),
            PrimaryTextFormField(
                label: 'NAMA PEMILIK REKENING',
                controller: controller.ownerNameOfAccountCtrl),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Container(
                      child: PrimaryButton(
                          label: 'Sebelumnya',
                          onPressed: () => controller.previousPage(),
                          isOutlined: true)),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                      child: PrimaryButton(
                          label: 'Simpan',
                          onPressed: () {
                            Get.dialog(
                                barrierDismissible: false,
                                PrimaryAlertDialog(
                                    title: 'Message',
                                    content:
                                        'Apa kamu ingin menyimpan data-data ini?',
                                    leftButtonText: 'Ya',
                                    rightButtonText: 'Tidak',
                                    leftButtonAction: () {
                                      controller.saveDataToLocalStorage();
                                    },
                                    rightButtonAction: () => Get.back()));
                          })),
                ),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
