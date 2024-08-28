import 'package:crowd_funding_sample_app/controller/personal_info_controller.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_button.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_datetime_picker.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_dropdown.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BiodataInfoPage extends StatelessWidget {
  final PersonalInfoController controller;
  BiodataInfoPage({super.key, required this.controller});

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
            PrimaryTextFormField(
                label: 'NAMA LENGKAP',
                isRequired: true,
                controller: controller.fullNameCtrl),
            SizedBox(height: 15),
            PrimaryDateTimePicker(
                label: 'TANGGAL LAHIR',
                isRequired: true,
                onSelect: (v) {
                  debugPrint('onselect birth date: $v');
                  controller.birthDate = v;
                  controller.update();
                },
                value: controller.birthDate),
            SizedBox(height: 15),
            PrimaryDropDown(
                label: 'JENIS KELAMIN',
                isRequired: true,
                items: controller.genderList,
                value: controller.genderChoosed,
                onChanged: (v) {
                  controller.genderChoosed = v as String;
                  controller.update();
                }),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              child: PrimaryTextFormField(
                label: 'ALAMAT EMAIL',
                isRequired: true,
                controller: controller.emailCtrl,
                keyboardType: TextInputType.emailAddress,
                readOnly: true,
              ),
            ),
            SizedBox(height: 15),
            PrimaryTextFormField(
              label: 'NO. HP',
              isRequired: true,
              controller: controller.phonNumberCtrl,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 15),
            PrimaryDropDown(
                label: 'PENDIDIKAN',
                isRequired: true,
                items: controller.educationList,
                value: controller.educationChoosed,
                onChanged: (v) {
                  controller.educationChoosed = v as String;
                  controller.update();
                }),
            SizedBox(height: 15),
            PrimaryDropDown(
                label: 'STATUS PERNIKAHAN',
                isRequired: true,
                items: controller.marriageStatusList,
                value: controller.marriageStatusChoosed,
                onChanged: (v) {
                  controller.marriageStatusChoosed = v as String;
                  controller.update();
                }),
            SizedBox(height: 15),
            Container(
                width: double.infinity,
                child: PrimaryButton(
                    label: 'Selanjutnya',
                    onPressed: (){
                      controller.formValidationStepOne();
                    })),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
