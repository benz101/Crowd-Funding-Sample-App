import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String? fullName;

  @HiveField(2)
  bool? alreadyRegistered;

  @HiveField(3)
  bool? alreadyLogin;

  @HiveField(4)
  DateTime? loginDateTime;

  @HiveField(5)
  DateTime? birthDate;

  @HiveField(6)
  String? gender;

  @HiveField(7)
  String? emailAddress;

  @HiveField(8)
  String? phoneNumber;

  @HiveField(9)
  String? password;

  @HiveField(10)
  String? education;

  @HiveField(11)
  String? marriageStatus;

  @HiveField(12)
  String? idCardNumber;

  @HiveField(13)
  String? addressOfIdCard;

  @HiveField(14)
  int? provinceId;

  @HiveField(15)
  String? province;

  @HiveField(16)
  int? districtId;

  @HiveField(17)
  String? district;

  @HiveField(18)
  int? regencyId;

  @HiveField(19)
  String? regency;

  @HiveField(20)
  int? villageId;

  @HiveField(21)
  String? village;

  @HiveField(22)
  String? postalCode;

  @HiveField(23)
  bool? domicileAddressEqualWithIdCardAddress;

  @HiveField(24)
  String? companyName;

  @HiveField(25)
  String? companyAddress;

  @HiveField(26)
  String? position;

  @HiveField(27)
  String? workDuration;

  @HiveField(28)
  String? sourceOfIncome;

  @HiveField(29)
  String? brutoIncomePerYear;

  @HiveField(30)
  String? bankName;

  @HiveField(31)
  String? bankBranch;

  @HiveField(32)
  String? accountNumber;

  @HiveField(33)
  String? ownerNameOfAccount;

  UserModel(
      {this.fullName,
      this.alreadyLogin,
      this.alreadyRegistered,
      this.loginDateTime,
      this.birthDate,
      this.gender,
      this.emailAddress,
      this.phoneNumber,
      this.password,
      this.education,
      this.marriageStatus,
      this.idCardNumber,
      this.addressOfIdCard,
      this.provinceId,
      this.province,
      this.districtId,
      this.district,
      this.regencyId,
      this.regency,
      this.villageId,
      this.village,
      this.postalCode,
      this.domicileAddressEqualWithIdCardAddress,
      this.companyName,
      this.companyAddress,
      this.position,
      this.workDuration,
      this.sourceOfIncome,
      this.brutoIncomePerYear,
      this.bankName,
      this.bankBranch,
      this.accountNumber,
      this.ownerNameOfAccount})
      : id = const Uuid().v4(); // Generates a unique ID for each user

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
