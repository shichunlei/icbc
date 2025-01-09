import 'package:realm/realm.dart';

part 'records.realm.dart';

@RealmModel()
class _Records {
  String? recordId;
  String? title;
  String? type;
  String? subType;
  String? subTypeText;
  String? icon;
  num money = .0;
  num balance = .0;
  String? account;
  String? mineCardNumber;
  String? mineName;
  String? bankName;
  String? time;
  String? counterpartAccount;
  String? counterpartCardNumber;
  String? counterpartName;
  String? counterpartBankName;
  String? country;
  String? currency;
  bool isOrder = false;
  bool includedIncomeExpenditure = false;
  String? summary;
  String? place;
  num accountingAmount = .0;
  String? remark;
  String? info;
  String? postscript;
  int timestamp = 0;
}
