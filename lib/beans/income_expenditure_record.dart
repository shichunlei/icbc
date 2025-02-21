import 'package:icbc/global/enum.dart';
import 'package:icbc/realm/records.dart';
import 'package:json_annotation/json_annotation.dart';

part 'income_expenditure_record.g.dart';

@JsonSerializable()
class RecordDateTime {
  int year;
  int month;
  int day;
  String? date;
  num income;
  num expenditure;
  String? monthIcon;
  String? monthBgImage;
  List<RecordDateTime> months;
  List<RecordDateTime> days;
  List<IncomeExpenditureRecord> items;

  RecordDateTime(
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
  String? id; // ID
  String? title;// 消费
  IncomeExpenditureType? type; // 类型 收入 income /支出 expenditure
  String? subType;// 交易类型枚举  财付通
  String? subTypeText;// 交易类型文字说明  微信转账
  String? icon;// 图标
  double money;// 金额
  double accountingAmount;// 实际交易金额
  double balance;// 余额
  String? account;// // 当前账户 3400****3455
  String? mineCardNumber;// 当前用户卡号 6217****0554
  String? mineName; // 当前用户名字 张三
  String? bankName;// 当前用户银行名称 工银借记卡0554
  String? time; // 交易时间 yyyy-MM-dd HH:mm:ss
  String? counterpartAccount; // 对方账号 2433****0133
  String? counterpartCardNumber; // 对方卡号 2433****0133
  String? counterpartName;// 对方名字 深圳市财付通支付科技有限公司
  String? counterpartBankName;// 对方银行名称  财付通-备付金账户
  String? country;// 国家 例如：CHN
  String? currency;// 币种 例如：人民币
  bool isOrder;// 是否为订单
  bool includedIncomeExpenditure;
  String? summary;// 摘要  消费
  String? place;// 交易场所  财付通-牛七爷全牛火锅
  String? remark;
  List<String> remarkImages;
  List<dynamic> recommend;
  String? info;
  String? postscript;

  IncomeExpenditureRecord({
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
    country: record.country,
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
      country: record.country,
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
