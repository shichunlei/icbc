import 'package:icbc/global/enum.dart';
import 'package:icbc/realm/records.dart';
import 'package:json_annotation/json_annotation.dart';

part 'income_expenditure_record.g.dart';

@JsonSerializable()
class RecordDateTime {
  final int year;
  final int month;
  final int day;
  final String? date;
  final num income;
  final num expenditure;
  final String? monthIcon;
  final String? monthBgImage;
  final List<RecordDateTime> months;
  final List<RecordDateTime> days;
  final List<IncomeExpenditureRecord> items;

  const RecordDateTime(
      {this.year = 2024,
      this.month = 1,
      this.day = 1,
      this.date,
      this.income = .0,
      this.expenditure = .0,
      this.items = const [],
      this.months = const [],
      this.days = const [],
      this.monthBgImage,
      this.monthIcon});

  factory RecordDateTime.fromJson(Map<String, dynamic> json) => _$RecordDateTimeFromJson(json);

  Map<String, dynamic> toJson() => _$RecordDateTimeToJson(this);
}

@JsonSerializable()
class IncomeExpenditureRecord {
  final String? id;
  final String? title;
  final IncomeExpenditureType? type;
  final String? subType;
  final String? subTypeText;
  final String? icon;
  final num money;
  final num balance;
  final String? account;
  final String? mineCardNumber;
  final String? mineName;
  final String? bankName;
  final String? time;
  final String? counterpartAccount;
  final String? counterpartCardNumber;
  final String? counterpartName;
  final String? counterpartBankName;
  final String? country;
  final String? currency;
  final bool isOrder;
  final bool includedIncomeExpenditure;
  final String? summary;
  final String? place;
  final num accountingAmount;
  final String? remark;
  final List<String> remarkImages;
  final List<dynamic> recommend;
  final String? info;
  final String? postscript;

  const IncomeExpenditureRecord({
    this.id,
    this.title,
    this.type,
    this.subType,
    this.subTypeText,
    this.icon,
    this.money = .0,
    this.balance = .0,
    this.account,
    this.mineCardNumber,
    this.mineName,
    this.bankName,
    this.time,
    this.counterpartCardNumber,
    this.counterpartAccount,
    this.counterpartName,
    this.counterpartBankName,
    this.country,
    this.currency,
    this.isOrder = false,
    this.includedIncomeExpenditure = false,
    this.summary,
    this.place,
    this.accountingAmount = .0,
    this.remark,
    this.remarkImages = const [],
    this.recommend = const [],
    this.info,
    this.postscript,
  });

  factory IncomeExpenditureRecord.fromJson(Map<String, dynamic> json) => _$IncomeExpenditureRecordFromJson(json);

  Map<String, dynamic> toJson() => _$IncomeExpenditureRecordToJson(this);
}

IncomeExpenditureRecord realmToEntity(Records record) {
  return IncomeExpenditureRecord(
    id: record.recordId,
    title: record.title,
    type: $enumDecodeNullable(_$IncomeExpenditureTypeEnumMap, record.type),
    info: record.info,
    postscript: record.postscript,
    remark: record.remark,
    accountingAmount: record.accountingAmount,
    isOrder: record.isOrder,
    place: record.place,
    summary: record.summary,
    includedIncomeExpenditure: record.includedIncomeExpenditure,
    currency: record.currency,
    counterpartBankName: record.counterpartBankName,
    counterpartName: record.counterpartName,
    counterpartAccount: record.counterpartAccount,
    counterpartCardNumber: record.counterpartCardNumber,
    time: record.time,
    bankName: record.bankName,
    mineCardNumber: record.mineCardNumber,
    mineName: record.mineName,
    account: record.account,
    money: record.money,
    balance: record.balance,
    icon: record.icon,
    subTypeText: record.subTypeText,
    subType: record.subType,
  );
}

Records entityToRealm(IncomeExpenditureRecord record) {
  return Records(
      recordId: record.id,
      title: record.title,
      type: record.type?.name,
      info: record.info,
      postscript: record.postscript,
      remark: record.remark,
      accountingAmount: record.accountingAmount,
      isOrder: record.isOrder,
      place: record.place,
      summary: record.summary,
      includedIncomeExpenditure: record.includedIncomeExpenditure,
      currency: record.currency,
      counterpartBankName: record.counterpartBankName,
      counterpartName: record.counterpartName,
      counterpartAccount: record.counterpartAccount,
      counterpartCardNumber: record.counterpartCardNumber,
      time: record.time,
      bankName: record.bankName,
      mineCardNumber: record.mineCardNumber,
      mineName: record.mineName,
      account: record.account,
      money: record.money,
      balance: record.balance,
      icon: record.icon,
      subTypeText: record.subTypeText,
      subType: record.subType,
      timestamp: record.time == null ? 0 : DateTime.parse(record.time!).millisecondsSinceEpoch);
}
