import 'dart:convert';

import 'package:crowd_funding_sample_app/helper/box_names.dart';
import 'package:crowd_funding_sample_app/helper/show_snackbar.dart';
import 'package:crowd_funding_sample_app/model/local/user_model.dart';
import 'package:crowd_funding_sample_app/model/response/list_of_districts.dart';
import 'package:crowd_funding_sample_app/model/response/list_of_provinces.dart';
import 'package:crowd_funding_sample_app/model/response/list_of_regencies.dart';
import 'package:crowd_funding_sample_app/model/response/list_of_villages.dart';
import 'package:crowd_funding_sample_app/service/bank_service.dart';
import 'package:crowd_funding_sample_app/service/hive_service.dart';
import 'package:crowd_funding_sample_app/service/location_service.dart';
import 'package:crowd_funding_sample_app/ui/profile_pages/personal_info/address_info_page.dart';
import 'package:crowd_funding_sample_app/ui/profile_pages/personal_info/biodata_info_page.dart';
import 'package:crowd_funding_sample_app/ui/profile_pages/personal_info/company_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PersonalInfoController extends GetxController {
  int currentStep = 0;
  late PageController pageViewcontroller;

  //biodata info
  TextEditingController fullNameCtrl = TextEditingController(text: '');
  DateTime? birthDate;
  TextEditingController emailCtrl = TextEditingController(text: '');
  TextEditingController phonNumberCtrl = TextEditingController(text: '');
  String genderChoosed = 'Pilih';
  List<DropdownMenuItem<dynamic>>? genderList = [
    DropdownMenuItem(
      child: Text('Pilih'),
      value: 'Pilih',
    ),
    DropdownMenuItem(
      child: Text('Laki-laki'),
      value: 'Laki-laki',
    ),
    DropdownMenuItem(
      child: Text('Perempuan'),
      value: 'Perempuan',
    )
  ];
  String educationChoosed = 'Pilih';
  List<DropdownMenuItem<dynamic>>? educationList = [
    DropdownMenuItem(
      child: Text('Pilih'),
      value: 'Pilih',
    ),
    DropdownMenuItem(
      child: Text('SD'),
      value: 'SD',
    ),
    DropdownMenuItem(
      child: Text('SMP'),
      value: 'SMP',
    ),
    DropdownMenuItem(
      child: Text('SMA'),
      value: 'SMA',
    ),
    DropdownMenuItem(
      child: Text('D1'),
      value: 'D1',
    ),
    DropdownMenuItem(
      child: Text('D2'),
      value: 'D2',
    ),
    DropdownMenuItem(
      child: Text('D3'),
      value: 'D3',
    ),
    DropdownMenuItem(
      child: Text('S1'),
      value: 'S1',
    ),
    DropdownMenuItem(
      child: Text('S2'),
      value: 'S2',
    ),
    DropdownMenuItem(
      child: Text('S3'),
      value: 'S3',
    )
  ];
  String marriageStatusChoosed = 'Pilih';
  List<DropdownMenuItem<dynamic>>? marriageStatusList = [
    DropdownMenuItem(
      child: Text('Pilih'),
      value: 'Pilih',
    ),
    DropdownMenuItem(
      child: Text('Belum Kawin'),
      value: 'Belum Kawin',
    ),
    DropdownMenuItem(
      child: Text('Kawin'),
      value: 'Kawin',
    )
  ];

  // addresss info variable
  TextEditingController numberOfIdCardCtrl = TextEditingController(text: '');
  TextEditingController addressOfIdCardCtrl = TextEditingController(text: '');
  LocationService _locationService = LocationService();
  int provinceIdChoosed = 0;
  String provinceLabelChoosed = '';
  List<DropdownMenuItem<dynamic>>? provincesList = [
    DropdownMenuItem(
      child: Text('Pilih'),
      value: 0,
    )
  ];

  int regencyIdChoosed = 0;
  String regencyLabelChoosed = '';
  List<DropdownMenuItem<dynamic>>? regenciesList = [
    DropdownMenuItem(
      child: Text('Pilih'),
      value: 0,
    )
  ];

  int districtIdChoosed = 0;
  String districtLabelChoosed = '';
  List<DropdownMenuItem<dynamic>>? districtsList = [
    DropdownMenuItem(
      child: Text('Pilih'),
      value: 0,
    )
  ];

  int villageIdChoosed = 0;
  String villageLabelChoosed = '';
  List<DropdownMenuItem<dynamic>>? villagesList = [
    DropdownMenuItem(
      child: Text('Pilih'),
      value: 0,
    )
  ];
  TextEditingController postalCodeCtrl = TextEditingController(text: '');
  bool equalWithIdCardAddress = false;

  //company info variable
  TextEditingController companyNameCtrl = TextEditingController(text: '');
  TextEditingController companyAddressCtrl = TextEditingController(text: '');
  String positionChoosed = 'Pilih';
  List<DropdownMenuItem<dynamic>>? positionList = [
    DropdownMenuItem(
      child: Text('Pilih'),
      value: 'Pilih',
    ),
    DropdownMenuItem(
      child: Text('Non-Staf'),
      value: 'Non-Staf',
    ),
    DropdownMenuItem(
      child: Text('Staf'),
      value: 'Staf',
    ),
    DropdownMenuItem(
      child: Text('Supervisor'),
      value: 'Supervisor',
    ),
    DropdownMenuItem(
      child: Text('Manajer'),
      value: 'Manajer',
    ),
    DropdownMenuItem(
      child: Text('Direktur'),
      value: 'Direktur',
    ),
    DropdownMenuItem(
      child: Text('Lainnya'),
      value: 'Lainnya',
    )
  ];
  String workDurationChoosed = 'Pilih';
  List<DropdownMenuItem<dynamic>>? workDurationList = [
    DropdownMenuItem(
      child: Text('Pilih'),
      value: 'Pilih',
    ),
    DropdownMenuItem(
      child: Text('< 6 Bulan'),
      value: '< 6 Bulan',
    ),
    DropdownMenuItem(
      child: Text('6 Bulan - 1 Tahun'),
      value: '6 Bulan - 1 Tahun',
    ),
    DropdownMenuItem(
      child: Text('1 - 2 Tahun'),
      value: '1 - 2 Tahun',
    ),
    DropdownMenuItem(
      child: Text('> 2 Tahun'),
      value: '> 2 Tahun',
    )
  ];

  String incomeSourceChoosed = 'Pilih';
  List<DropdownMenuItem<dynamic>>? incomeSourceList = [
    DropdownMenuItem(
      child: Text('Pilih'),
      value: 'Pilih',
    ),
    DropdownMenuItem(
      child: Text('Gaji'),
      value: 'Gaji',
    ),
    DropdownMenuItem(
      child: Text('Keuntungan Bisnis'),
      value: 'Keuntungan Bisnis',
    ),
    DropdownMenuItem(
      child: Text('Bunga Tabungan'),
      value: 'Bunga Tabungan',
    ),
    DropdownMenuItem(
      child: Text('Warisan'),
      value: 'Warisan',
    ),
    DropdownMenuItem(
      child: Text('Dana dari orang tua atau anak'),
      value: 'Dana dari orang tua atau anak',
    ),
    DropdownMenuItem(
      child: Text('Undian'),
      value: 'Undian',
    ),
    DropdownMenuItem(
      child: Text('Keuntungan Investasi'),
      value: 'Keuntungan Investasi',
    ),
    DropdownMenuItem(
      child: Text('Lainnya'),
      value: 'Lainnya',
    )
  ];

  String brutoIncomePerYearChoosed = 'Pilih';
  List<DropdownMenuItem<dynamic>>? brutoIncomePerYearList = [
    DropdownMenuItem(
      child: Text('Pilih'),
      value: 'Pilih',
    ),
    DropdownMenuItem(
      child: Text('< 10 Juta'),
      value: '< 10 Juta',
    ),
    DropdownMenuItem(
      child: Text('10 - 50 Juta'),
      value: '10 - 50 Juta',
    ),
    DropdownMenuItem(
      child: Text('50 - 100 Juta'),
      value: '50 - 100 Juta',
    ),
    DropdownMenuItem(
      child: Text('100 - 500 Juta'),
      value: '100 - 500 Juta',
    ),
    DropdownMenuItem(
      child: Text('500 Juta - 1 Milyar'),
      value: '00 Juta - 1 Milyar',
    ),
    DropdownMenuItem(
      child: Text('> 1 Milyar'),
      value: '> 1 Milyar',
    ),
  ];

  String bankChoosed = 'Pilih';
  List<DropdownMenuItem<dynamic>>? banksList = [
    DropdownMenuItem(
      child: Text('Pilih'),
      value: 'Pilih',
    ),
  ];

  final _bankService = BankService();
  TextEditingController bankBranchCtrl = TextEditingController(text: '');
  TextEditingController accountNumberCtrl = TextEditingController(text: '');
  TextEditingController ownerNameOfAccountCtrl =
      TextEditingController(text: '');

  @override
  void onInit() {
    pageViewcontroller = PageController(initialPage: 0);
    autoFill();
    super.onInit();
  }

  @override
  void onClose() {
    pageViewcontroller.dispose();
    super.onClose();
  }

  void nextPage() {
    if (pageViewcontroller.page! < 2) {
      currentStep = pageViewcontroller.page!.toInt() + 1;
      debugPrint('currentStep: $currentStep');
      update();
      pageViewcontroller.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  void previousPage() {
    if (pageViewcontroller.page! >= 0) {
      currentStep = pageViewcontroller.page!.toInt() - 1;
      update();
      pageViewcontroller.previousPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  //Function of address info
  Future<void> getListOfProvinces() async {
    try {
      final result = await _locationService.getListOfProvinces();
      provincesList!.addAll(result!
          .map((e) => DropdownMenuItem(child: Text('${e.name}'), value: e.id)));
      update();
    } catch (e) {
      showSnackBar(message: 'Get List Of Provinces error because $e');
    }
  }

  Future<void> getListOfRegencies(int provinceId) async {
    try {
      final result = await _locationService.getListOfRegencies(provinceId);
      regenciesList!.addAll(result!
          .map((e) => DropdownMenuItem(child: Text('${e.name}'), value: e.id)));
      update();
    } catch (e) {
      showSnackBar(message: 'Get List Of Regencies error because $e');
    }
  }

  Future<void> getListOfDistricts(int regencyId) async {
    try {
      final result = await _locationService.getListOfDistricts(regencyId);
      districtsList!.addAll(result!
          .map((e) => DropdownMenuItem(child: Text('${e.name}'), value: e.id)));
      update();
    } catch (e) {
      showSnackBar(message: 'Get List Of Districts error because $e');
    }
  }

  Future<void> getListOfVillages(int districtId) async {
    try {
      final result = await _locationService.getListOfVillages(districtId);
      villagesList!.addAll(result!
          .map((e) => DropdownMenuItem(child: Text('${e.name}'), value: e.id)));
      update();
    } catch (e) {
      showSnackBar(message: 'Get List Of Villages error because $e');
    }
  }

  //Function of company info
  Future<void> getListOfBanks() async {
    try {
      final result = await _bankService.getListOfBanks();
      banksList!.addAll(result!.map(
          (e) => DropdownMenuItem(child: Text('${e.name}'), value: e.name)));
      update();
    } catch (e) {
      showSnackBar(message: 'Get List Of Banks error because $e');
    }
  }

  void formValidationStepOne() {
    if (fullNameCtrl.text.isEmpty ||
        birthDate == null ||
        emailCtrl.text.isEmpty ||
        phonNumberCtrl.text.isEmpty ||
        genderChoosed == 'PILIH' ||
        educationChoosed == 'PILIH' ||
        marriageStatusChoosed == 'PILIH') {
      showSnackBar(message: 'Text input yang mandatory harus diisi');
      return;
    }

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailCtrl.text)) {
      showSnackBar(message: 'Format email todak valid');
      return;
    }

    if (phonNumberCtrl.text.length < 6) {
      showSnackBar(message: 'No handphone harus minimal 6 digit');
      return;
    }

    nextPage();
  }

  void formValidationStepTwo() {
    if (numberOfIdCardCtrl.text.isEmpty ||
        addressOfIdCardCtrl.text.isEmpty ||
        provinceIdChoosed == 0 ||
        regencyIdChoosed == 0 ||
        villageIdChoosed == 0 ||
        postalCodeCtrl.text.isEmpty) {
      showSnackBar(message: 'Text input yang mandatory harus diisi');
      return;
    }

    if (numberOfIdCardCtrl.text.length < 16) {
      showSnackBar(message: 'NIK harus 16 digit');
      return;
    }
    nextPage();
  }

  Future<void> autoFill() async {
    //step one
    final currentUserModel =
        await HIVEService<UserModel>(boxName: USER_DATA).get('user_data_id');

    fullNameCtrl.text = currentUserModel?.fullName ?? '';
    birthDate = currentUserModel?.birthDate;
    emailCtrl.text = currentUserModel?.emailAddress ?? '';
    phonNumberCtrl.text = currentUserModel?.phoneNumber ?? '';
    genderChoosed = currentUserModel?.gender ?? 'Pilih';
    educationChoosed = currentUserModel?.education ?? 'Pilih';
    marriageStatusChoosed = currentUserModel?.marriageStatus ?? 'Pilih';

    //step two
    numberOfIdCardCtrl.text = currentUserModel?.idCardNumber ?? '';
    addressOfIdCardCtrl.text = currentUserModel?.addressOfIdCard ?? '';
    await getListOfProvinces();
    if (currentUserModel?.provinceId != null) {
      debugPrint(
          'currentUserModel?.provinceId: ${currentUserModel?.provinceId}');
      provinceIdChoosed = currentUserModel!.provinceId!;
      // provincesList = [
      //   DropdownMenuItem(
      //     child: Text(currentUserModel.province ?? 'Pilih'),
      //     value: provinceIdChoosed,
      //   )
      // ];
      await getListOfRegencies(currentUserModel.provinceId!);
    }

    if (currentUserModel?.regencyId != null) {
      debugPrint('currentUserModel?.regencyId ${currentUserModel?.regencyId}');
      regencyIdChoosed = currentUserModel!.regencyId!;
      // regenciesList = [
      //   DropdownMenuItem(
      //     child: Text(currentUserModel.regency ?? 'Pilih'),
      //     value: regencyIdChoosed,
      //   )
      // ];
      await getListOfDistricts(currentUserModel.regencyId!);
    }
    if (currentUserModel?.districtId != null) {
      debugPrint(
          'currentUserModel?.districtId: ${currentUserModel?.districtId}');
      districtIdChoosed = currentUserModel!.districtId!;
      // districtsList = [
      //   DropdownMenuItem(
      //     child: Text(currentUserModel.district ?? 'Pilih'),
      //     value: districtIdChoosed,
      //   )
      // ];
      await getListOfVillages(currentUserModel.districtId!);
    }

    if (currentUserModel?.villageId != null) {
      villageIdChoosed = currentUserModel!.villageId!;
      // villagesList = [
      //   DropdownMenuItem(
      //     child: Text(currentUserModel.village ?? 'Pilih'),
      //     value: villageIdChoosed,
      //   )
      // ];
    }
    postalCodeCtrl.text = currentUserModel?.postalCode ?? '';

    //step 3
    companyNameCtrl.text = currentUserModel?.companyName ?? '';
    companyAddressCtrl.text = currentUserModel?.addressOfIdCard ?? '';
    positionChoosed = currentUserModel?.position ?? 'Pilih';
    workDurationChoosed = currentUserModel?.workDuration ?? 'Pilih';
    incomeSourceChoosed = currentUserModel?.sourceOfIncome ?? 'Pilih';
    brutoIncomePerYearChoosed = currentUserModel?.brutoIncomePerYear ?? 'Pilih';
    await getListOfBanks();
    bankChoosed = currentUserModel?.bankName ?? 'Pilih';
    // banksList = [
    //   DropdownMenuItem(
    //     child: Text(currentUserModel?.bankName ?? 'Pilih'),
    //     value: currentUserModel?.bankName ?? 'Pilih',
    //   ),
    // ];
    accountNumberCtrl.text = currentUserModel?.accountNumber ?? '';
    bankBranchCtrl.text = currentUserModel?.bankBranch ?? '';
    ownerNameOfAccountCtrl.text = currentUserModel?.ownerNameOfAccount ?? '';
  }

  //Funtion os save to local storage
  Future<void> saveDataToLocalStorage() async {
    try {
      final currentUserModel =
          await HIVEService<UserModel>(boxName: USER_DATA).get('user_data_id');
      UserModel userModel = UserModel(
          //step one
          fullName: fullNameCtrl.text,
          alreadyLogin: currentUserModel?.alreadyLogin,
          alreadyRegistered: currentUserModel?.alreadyRegistered,
          loginDateTime: currentUserModel?.loginDateTime,
          birthDate: birthDate,
          gender: genderChoosed,
          //step two
          emailAddress: currentUserModel?.emailAddress,
          phoneNumber: phonNumberCtrl.text,
          password: currentUserModel?.password,
          education: educationChoosed,
          marriageStatus: marriageStatusChoosed,
          idCardNumber: numberOfIdCardCtrl.text,
          addressOfIdCard: addressOfIdCardCtrl.text,
          provinceId: provinceIdChoosed == 0 ? null : provinceIdChoosed,
          province: (await _locationService.getListOfProvinces())
              ?.firstWhere((e) => e.id == provinceIdChoosed)
              .name,
          regencyId: regencyIdChoosed == 0 ? null : regencyIdChoosed,
          regency:
              (await _locationService.getListOfRegencies(provinceIdChoosed))
                  ?.firstWhere((e) => e.id == regencyIdChoosed)
                  .name,
          districtId: districtIdChoosed == 0 ? null : districtIdChoosed,
          district:
              (await _locationService.getListOfDistricts(regencyIdChoosed))
                  ?.firstWhere((e) => e.id == districtIdChoosed)
                  .name,
          villageId: villageIdChoosed == 0 ? null : villageIdChoosed,
          village: (await _locationService.getListOfVillages(districtIdChoosed))
              ?.firstWhere((e) => e.id == villageIdChoosed)
              .name,
          postalCode: postalCodeCtrl.text,
          domicileAddressEqualWithIdCardAddress: equalWithIdCardAddress,
          //step three
          companyName:
              companyNameCtrl.text.isEmpty ? null : companyNameCtrl.text,
          companyAddress:
              companyAddressCtrl.text.isEmpty ? null : companyAddressCtrl.text,
          position: positionChoosed == 'Pilih' ? null : positionChoosed,
          workDuration:
              workDurationChoosed == 'Pilih' ? null : workDurationChoosed,
          sourceOfIncome:
              incomeSourceChoosed == 'Pilih' ? null : incomeSourceChoosed,
          brutoIncomePerYear: brutoIncomePerYearChoosed == 'Pilih'
              ? null
              : brutoIncomePerYearChoosed,
          bankName: bankChoosed == 'Pilih' ? null : bankChoosed,
          bankBranch: bankBranchCtrl.text.isEmpty ? null : bankBranchCtrl.text,
          accountNumber:
              accountNumberCtrl.text.isEmpty ? null : accountNumberCtrl.text,
          ownerNameOfAccount: ownerNameOfAccountCtrl.text.isEmpty
              ? null
              : ownerNameOfAccountCtrl.text);
      debugPrint('usermodel: ${jsonEncode(userModel.toJson())}');
      await HIVEService<UserModel>(boxName: USER_DATA)
          .saveToObjectById('user_data_id', userModel);
      Get.back();
      Get.back();
      showSnackBar(message: 'Data berhasil disimpan');
    } catch (e) {
      showSnackBar(message: 'Data gagal disimpan karena $e');
    }
  }
}
