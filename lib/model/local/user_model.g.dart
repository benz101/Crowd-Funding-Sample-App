// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      fullName: fields[1] as String?,
      alreadyLogin: fields[3] as bool?,
      alreadyRegistered: fields[2] as bool?,
      loginDateTime: fields[4] as DateTime?,
      birthDate: fields[5] as DateTime?,
      gender: fields[6] as String?,
      emailAddress: fields[7] as String?,
      phoneNumber: fields[8] as String?,
      password: fields[9] as String?,
      education: fields[10] as String?,
      marriageStatus: fields[11] as String?,
      idCardNumber: fields[12] as String?,
      addressOfIdCard: fields[13] as String?,
      provinceId: fields[14] as int?,
      province: fields[15] as String?,
      districtId: fields[16] as int?,
      district: fields[17] as String?,
      regencyId: fields[18] as int?,
      regency: fields[19] as String?,
      villageId: fields[20] as int?,
      village: fields[21] as String?,
      postalCode: fields[22] as String?,
      domicileAddressEqualWithIdCardAddress: fields[23] as bool?,
      companyName: fields[24] as String?,
      companyAddress: fields[25] as String?,
      position: fields[26] as String?,
      workDuration: fields[27] as String?,
      sourceOfIncome: fields[28] as String?,
      brutoIncomePerYear: fields[29] as String?,
      bankName: fields[30] as String?,
      bankBranch: fields[31] as String?,
      accountNumber: fields[32] as String?,
      ownerNameOfAccount: fields[33] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(34)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.alreadyRegistered)
      ..writeByte(3)
      ..write(obj.alreadyLogin)
      ..writeByte(4)
      ..write(obj.loginDateTime)
      ..writeByte(5)
      ..write(obj.birthDate)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.emailAddress)
      ..writeByte(8)
      ..write(obj.phoneNumber)
      ..writeByte(9)
      ..write(obj.password)
      ..writeByte(10)
      ..write(obj.education)
      ..writeByte(11)
      ..write(obj.marriageStatus)
      ..writeByte(12)
      ..write(obj.idCardNumber)
      ..writeByte(13)
      ..write(obj.addressOfIdCard)
      ..writeByte(14)
      ..write(obj.provinceId)
      ..writeByte(15)
      ..write(obj.province)
      ..writeByte(16)
      ..write(obj.districtId)
      ..writeByte(17)
      ..write(obj.district)
      ..writeByte(18)
      ..write(obj.regencyId)
      ..writeByte(19)
      ..write(obj.regency)
      ..writeByte(20)
      ..write(obj.villageId)
      ..writeByte(21)
      ..write(obj.village)
      ..writeByte(22)
      ..write(obj.postalCode)
      ..writeByte(23)
      ..write(obj.domicileAddressEqualWithIdCardAddress)
      ..writeByte(24)
      ..write(obj.companyName)
      ..writeByte(25)
      ..write(obj.companyAddress)
      ..writeByte(26)
      ..write(obj.position)
      ..writeByte(27)
      ..write(obj.workDuration)
      ..writeByte(28)
      ..write(obj.sourceOfIncome)
      ..writeByte(29)
      ..write(obj.brutoIncomePerYear)
      ..writeByte(30)
      ..write(obj.bankName)
      ..writeByte(31)
      ..write(obj.bankBranch)
      ..writeByte(32)
      ..write(obj.accountNumber)
      ..writeByte(33)
      ..write(obj.ownerNameOfAccount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fullName: json['fullName'] as String?,
      alreadyLogin: json['alreadyLogin'] as bool?,
      alreadyRegistered: json['alreadyRegistered'] as bool?,
      loginDateTime: json['loginDateTime'] == null
          ? null
          : DateTime.parse(json['loginDateTime'] as String),
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: json['gender'] as String?,
      emailAddress: json['emailAddress'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      education: json['education'] as String?,
      marriageStatus: json['marriageStatus'] as String?,
      idCardNumber: json['idCardNumber'] as String?,
      addressOfIdCard: json['addressOfIdCard'] as String?,
      provinceId: (json['provinceId'] as num?)?.toInt(),
      province: json['province'] as String?,
      districtId: (json['districtId'] as num?)?.toInt(),
      district: json['district'] as String?,
      regencyId: (json['regencyId'] as num?)?.toInt(),
      regency: json['regency'] as String?,
      villageId: (json['villageId'] as num?)?.toInt(),
      village: json['village'] as String?,
      postalCode: json['postalCode'] as String?,
      domicileAddressEqualWithIdCardAddress:
          json['domicileAddressEqualWithIdCardAddress'] as bool?,
      companyName: json['companyName'] as String?,
      companyAddress: json['companyAddress'] as String?,
      position: json['position'] as String?,
      workDuration: json['workDuration'] as String?,
      sourceOfIncome: json['sourceOfIncome'] as String?,
      brutoIncomePerYear: json['brutoIncomePerYear'] as String?,
      bankName: json['bankName'] as String?,
      bankBranch: json['bankBranch'] as String?,
      accountNumber: json['accountNumber'] as String?,
      ownerNameOfAccount: json['ownerNameOfAccount'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'alreadyRegistered': instance.alreadyRegistered,
      'alreadyLogin': instance.alreadyLogin,
      'loginDateTime': instance.loginDateTime?.toIso8601String(),
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': instance.gender,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'education': instance.education,
      'marriageStatus': instance.marriageStatus,
      'idCardNumber': instance.idCardNumber,
      'addressOfIdCard': instance.addressOfIdCard,
      'provinceId': instance.provinceId,
      'province': instance.province,
      'districtId': instance.districtId,
      'district': instance.district,
      'regencyId': instance.regencyId,
      'regency': instance.regency,
      'villageId': instance.villageId,
      'village': instance.village,
      'postalCode': instance.postalCode,
      'domicileAddressEqualWithIdCardAddress':
          instance.domicileAddressEqualWithIdCardAddress,
      'companyName': instance.companyName,
      'companyAddress': instance.companyAddress,
      'position': instance.position,
      'workDuration': instance.workDuration,
      'sourceOfIncome': instance.sourceOfIncome,
      'brutoIncomePerYear': instance.brutoIncomePerYear,
      'bankName': instance.bankName,
      'bankBranch': instance.bankBranch,
      'accountNumber': instance.accountNumber,
      'ownerNameOfAccount': instance.ownerNameOfAccount,
    };
