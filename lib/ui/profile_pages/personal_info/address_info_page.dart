import 'package:crowd_funding_sample_app/controller/personal_info_controller.dart';
import 'package:crowd_funding_sample_app/model/response/list_of_provinces.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_button.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_datetime_picker.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_dropdown.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddressInfoPage extends StatelessWidget {
  final PersonalInfoController controller;
  AddressInfoPage({super.key, required this.controller});

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
                label: 'NIK',
                isRequired: true,
                controller: controller.numberOfIdCardCtrl,
                keyboardType: TextInputType.number),
            SizedBox(height: 15),
            PrimaryTextFormField(
                label: 'ALAMAT SESUAI KTP',
                isRequired: true,
                controller: controller.addressOfIdCardCtrl),
            SizedBox(height: 15),
            PrimaryDropDown(
              label: 'PROVINSI',
              isRequired: true,
              items: controller.provincesList,
              value: controller.provinceIdChoosed,
              onChanged: (v) {
                controller.provinceIdChoosed = v as int;
                //start cleared
                controller.regenciesList = [
                  DropdownMenuItem(child: Text('Pilih'), value: 0)
                ];
                controller.regencyIdChoosed = 0;
                controller.districtsList = [
                  DropdownMenuItem(child: Text('Pilih'), value: 0)
                ];
                controller.districtIdChoosed = 0;
                controller.villagesList = [
                  DropdownMenuItem(child: Text('Pilih'), value: 0)
                ];
                controller.villageIdChoosed = 0;
                controller.update();
                //end cleared
                controller.getListOfRegencies(controller.provinceIdChoosed);
              },
            ),
            SizedBox(height: 15),
            PrimaryDropDown(
              label: 'KOTA/KABUPATEN',
              isRequired: true,
              items: controller.regenciesList,
              value: controller.regencyIdChoosed,
              onChanged: (v) {
                debugPrint('regency id: $v');
                controller.regencyIdChoosed = v as int;
                 //start cleared
                controller.districtIdChoosed = 0;
                controller.villagesList = [
                  DropdownMenuItem(child: Text('Pilih'), value: 0)
                ];
                controller.villageIdChoosed = 0;
                controller.update();
                //end cleared
                controller.getListOfDistricts(controller.regencyIdChoosed);
              },
            ),
            SizedBox(height: 15),
            PrimaryDropDown(
              label: 'KECAMATAN',
              isRequired: true,
              items: controller.districtsList,
              value: controller.districtIdChoosed,
              onChanged: (v) {
                controller.districtIdChoosed = v as int;
                controller.getListOfVillages(controller.districtIdChoosed);
              },
            ),
            SizedBox(height: 15),
            PrimaryDropDown(
              label: 'KELURAHAN',
              isRequired: true,
              items: controller.villagesList,
              value: controller.villageIdChoosed,
              onChanged: (v) {
                controller.villageIdChoosed = v as int;
                controller.update();
              },
            ),
            SizedBox(height: 15),
            PrimaryTextFormField(
              label: 'KODE POS',
              isRequired: true,
              keyboardType: TextInputType.number,
              controller: controller.postalCodeCtrl,
            ),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: controller.equalWithIdCardAddress,
                  onChanged: (v) {
                    if (v ?? false) {
                      controller.equalWithIdCardAddress = true;
                    } else {
                      controller.equalWithIdCardAddress = false;
                    }
                    controller.update();
                  },
                  activeColor: Colors.orange[300],
                  checkColor: Colors.white,
                ),
                SizedBox(width: 5),
                Expanded(child: Text('Alamat domisili sama dengan alamat KTP'))
              ],
            ),
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
                          label: 'Selanjutnya',
                          onPressed: () => controller.formValidationStepTwo())),
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
