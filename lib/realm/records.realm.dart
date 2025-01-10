// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Records extends _Records with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Records({
    String? recordId,
    String? title,
    String? type,
    String? subType,
    String? subTypeText,
    String? icon,
    double money = .0,
    double balance = .0,
    String? account,
    String? mineCardNumber,
    String? mineName,
    String? bankName,
    String? time,
    String? counterpartAccount,
    String? counterpartCardNumber,
    String? counterpartName,
    String? counterpartBankName,
    String? country,
    String? currency,
    bool isOrder = false,
    bool includedIncomeExpenditure = false,
    String? summary,
    String? place,
    double accountingAmount = .0,
    String? remark,
    String? info,
    String? postscript,
    int timestamp = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Records>({
        'money': .0,
        'balance': .0,
        'isOrder': false,
        'includedIncomeExpenditure': false,
        'accountingAmount': .0,
        'timestamp': 0,
      });
    }
    RealmObjectBase.set(this, 'recordId', recordId);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'subType', subType);
    RealmObjectBase.set(this, 'subTypeText', subTypeText);
    RealmObjectBase.set(this, 'icon', icon);
    RealmObjectBase.set(this, 'money', money);
    RealmObjectBase.set(this, 'balance', balance);
    RealmObjectBase.set(this, 'account', account);
    RealmObjectBase.set(this, 'mineCardNumber', mineCardNumber);
    RealmObjectBase.set(this, 'mineName', mineName);
    RealmObjectBase.set(this, 'bankName', bankName);
    RealmObjectBase.set(this, 'time', time);
    RealmObjectBase.set(this, 'counterpartAccount', counterpartAccount);
    RealmObjectBase.set(this, 'counterpartCardNumber', counterpartCardNumber);
    RealmObjectBase.set(this, 'counterpartName', counterpartName);
    RealmObjectBase.set(this, 'counterpartBankName', counterpartBankName);
    RealmObjectBase.set(this, 'country', country);
    RealmObjectBase.set(this, 'currency', currency);
    RealmObjectBase.set(this, 'isOrder', isOrder);
    RealmObjectBase.set(
        this, 'includedIncomeExpenditure', includedIncomeExpenditure);
    RealmObjectBase.set(this, 'summary', summary);
    RealmObjectBase.set(this, 'place', place);
    RealmObjectBase.set(this, 'accountingAmount', accountingAmount);
    RealmObjectBase.set(this, 'remark', remark);
    RealmObjectBase.set(this, 'info', info);
    RealmObjectBase.set(this, 'postscript', postscript);
    RealmObjectBase.set(this, 'timestamp', timestamp);
  }

  Records._();

  @override
  String? get recordId =>
      RealmObjectBase.get<String>(this, 'recordId') as String?;
  @override
  set recordId(String? value) => RealmObjectBase.set(this, 'recordId', value);

  @override
  String? get title => RealmObjectBase.get<String>(this, 'title') as String?;
  @override
  set title(String? value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get type => RealmObjectBase.get<String>(this, 'type') as String?;
  @override
  set type(String? value) => RealmObjectBase.set(this, 'type', value);

  @override
  String? get subType =>
      RealmObjectBase.get<String>(this, 'subType') as String?;
  @override
  set subType(String? value) => RealmObjectBase.set(this, 'subType', value);

  @override
  String? get subTypeText =>
      RealmObjectBase.get<String>(this, 'subTypeText') as String?;
  @override
  set subTypeText(String? value) =>
      RealmObjectBase.set(this, 'subTypeText', value);

  @override
  String? get icon => RealmObjectBase.get<String>(this, 'icon') as String?;
  @override
  set icon(String? value) => RealmObjectBase.set(this, 'icon', value);

  @override
  double get money => RealmObjectBase.get<double>(this, 'money') as double;
  @override
  set money(double value) => RealmObjectBase.set(this, 'money', value);

  @override
  double get balance => RealmObjectBase.get<double>(this, 'balance') as double;
  @override
  set balance(double value) => RealmObjectBase.set(this, 'balance', value);

  @override
  String? get account =>
      RealmObjectBase.get<String>(this, 'account') as String?;
  @override
  set account(String? value) => RealmObjectBase.set(this, 'account', value);

  @override
  String? get mineCardNumber =>
      RealmObjectBase.get<String>(this, 'mineCardNumber') as String?;
  @override
  set mineCardNumber(String? value) =>
      RealmObjectBase.set(this, 'mineCardNumber', value);

  @override
  String? get mineName =>
      RealmObjectBase.get<String>(this, 'mineName') as String?;
  @override
  set mineName(String? value) => RealmObjectBase.set(this, 'mineName', value);

  @override
  String? get bankName =>
      RealmObjectBase.get<String>(this, 'bankName') as String?;
  @override
  set bankName(String? value) => RealmObjectBase.set(this, 'bankName', value);

  @override
  String? get time => RealmObjectBase.get<String>(this, 'time') as String?;
  @override
  set time(String? value) => RealmObjectBase.set(this, 'time', value);

  @override
  String? get counterpartAccount =>
      RealmObjectBase.get<String>(this, 'counterpartAccount') as String?;
  @override
  set counterpartAccount(String? value) =>
      RealmObjectBase.set(this, 'counterpartAccount', value);

  @override
  String? get counterpartCardNumber =>
      RealmObjectBase.get<String>(this, 'counterpartCardNumber') as String?;
  @override
  set counterpartCardNumber(String? value) =>
      RealmObjectBase.set(this, 'counterpartCardNumber', value);

  @override
  String? get counterpartName =>
      RealmObjectBase.get<String>(this, 'counterpartName') as String?;
  @override
  set counterpartName(String? value) =>
      RealmObjectBase.set(this, 'counterpartName', value);

  @override
  String? get counterpartBankName =>
      RealmObjectBase.get<String>(this, 'counterpartBankName') as String?;
  @override
  set counterpartBankName(String? value) =>
      RealmObjectBase.set(this, 'counterpartBankName', value);

  @override
  String? get country =>
      RealmObjectBase.get<String>(this, 'country') as String?;
  @override
  set country(String? value) => RealmObjectBase.set(this, 'country', value);

  @override
  String? get currency =>
      RealmObjectBase.get<String>(this, 'currency') as String?;
  @override
  set currency(String? value) => RealmObjectBase.set(this, 'currency', value);

  @override
  bool get isOrder => RealmObjectBase.get<bool>(this, 'isOrder') as bool;
  @override
  set isOrder(bool value) => RealmObjectBase.set(this, 'isOrder', value);

  @override
  bool get includedIncomeExpenditure =>
      RealmObjectBase.get<bool>(this, 'includedIncomeExpenditure') as bool;
  @override
  set includedIncomeExpenditure(bool value) =>
      RealmObjectBase.set(this, 'includedIncomeExpenditure', value);

  @override
  String? get summary =>
      RealmObjectBase.get<String>(this, 'summary') as String?;
  @override
  set summary(String? value) => RealmObjectBase.set(this, 'summary', value);

  @override
  String? get place => RealmObjectBase.get<String>(this, 'place') as String?;
  @override
  set place(String? value) => RealmObjectBase.set(this, 'place', value);

  @override
  double get accountingAmount =>
      RealmObjectBase.get<double>(this, 'accountingAmount') as double;
  @override
  set accountingAmount(double value) =>
      RealmObjectBase.set(this, 'accountingAmount', value);

  @override
  String? get remark => RealmObjectBase.get<String>(this, 'remark') as String?;
  @override
  set remark(String? value) => RealmObjectBase.set(this, 'remark', value);

  @override
  String? get info => RealmObjectBase.get<String>(this, 'info') as String?;
  @override
  set info(String? value) => RealmObjectBase.set(this, 'info', value);

  @override
  String? get postscript =>
      RealmObjectBase.get<String>(this, 'postscript') as String?;
  @override
  set postscript(String? value) =>
      RealmObjectBase.set(this, 'postscript', value);

  @override
  int get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int;
  @override
  set timestamp(int value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  Stream<RealmObjectChanges<Records>> get changes =>
      RealmObjectBase.getChanges<Records>(this);

  @override
  Stream<RealmObjectChanges<Records>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Records>(this, keyPaths);

  @override
  Records freeze() => RealmObjectBase.freezeObject<Records>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'recordId': recordId.toEJson(),
      'title': title.toEJson(),
      'type': type.toEJson(),
      'subType': subType.toEJson(),
      'subTypeText': subTypeText.toEJson(),
      'icon': icon.toEJson(),
      'money': money.toEJson(),
      'balance': balance.toEJson(),
      'account': account.toEJson(),
      'mineCardNumber': mineCardNumber.toEJson(),
      'mineName': mineName.toEJson(),
      'bankName': bankName.toEJson(),
      'time': time.toEJson(),
      'counterpartAccount': counterpartAccount.toEJson(),
      'counterpartCardNumber': counterpartCardNumber.toEJson(),
      'counterpartName': counterpartName.toEJson(),
      'counterpartBankName': counterpartBankName.toEJson(),
      'country': country.toEJson(),
      'currency': currency.toEJson(),
      'isOrder': isOrder.toEJson(),
      'includedIncomeExpenditure': includedIncomeExpenditure.toEJson(),
      'summary': summary.toEJson(),
      'place': place.toEJson(),
      'accountingAmount': accountingAmount.toEJson(),
      'remark': remark.toEJson(),
      'info': info.toEJson(),
      'postscript': postscript.toEJson(),
      'timestamp': timestamp.toEJson(),
    };
  }

  static EJsonValue _toEJson(Records value) => value.toEJson();
  static Records _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return Records(
      recordId: fromEJson(ejson['recordId']),
      title: fromEJson(ejson['title']),
      type: fromEJson(ejson['type']),
      subType: fromEJson(ejson['subType']),
      subTypeText: fromEJson(ejson['subTypeText']),
      icon: fromEJson(ejson['icon']),
      money: fromEJson(ejson['money'], defaultValue: .0),
      balance: fromEJson(ejson['balance'], defaultValue: .0),
      account: fromEJson(ejson['account']),
      mineCardNumber: fromEJson(ejson['mineCardNumber']),
      mineName: fromEJson(ejson['mineName']),
      bankName: fromEJson(ejson['bankName']),
      time: fromEJson(ejson['time']),
      counterpartAccount: fromEJson(ejson['counterpartAccount']),
      counterpartCardNumber: fromEJson(ejson['counterpartCardNumber']),
      counterpartName: fromEJson(ejson['counterpartName']),
      counterpartBankName: fromEJson(ejson['counterpartBankName']),
      country: fromEJson(ejson['country']),
      currency: fromEJson(ejson['currency']),
      isOrder: fromEJson(ejson['isOrder'], defaultValue: false),
      includedIncomeExpenditure:
          fromEJson(ejson['includedIncomeExpenditure'], defaultValue: false),
      summary: fromEJson(ejson['summary']),
      place: fromEJson(ejson['place']),
      accountingAmount: fromEJson(ejson['accountingAmount'], defaultValue: .0),
      remark: fromEJson(ejson['remark']),
      info: fromEJson(ejson['info']),
      postscript: fromEJson(ejson['postscript']),
      timestamp: fromEJson(ejson['timestamp'], defaultValue: 0),
    );
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Records._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Records, 'Records', [
      SchemaProperty('recordId', RealmPropertyType.string, optional: true),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('type', RealmPropertyType.string, optional: true),
      SchemaProperty('subType', RealmPropertyType.string, optional: true),
      SchemaProperty('subTypeText', RealmPropertyType.string, optional: true),
      SchemaProperty('icon', RealmPropertyType.string, optional: true),
      SchemaProperty('money', RealmPropertyType.double),
      SchemaProperty('balance', RealmPropertyType.double),
      SchemaProperty('account', RealmPropertyType.string, optional: true),
      SchemaProperty('mineCardNumber', RealmPropertyType.string,
          optional: true),
      SchemaProperty('mineName', RealmPropertyType.string, optional: true),
      SchemaProperty('bankName', RealmPropertyType.string, optional: true),
      SchemaProperty('time', RealmPropertyType.string, optional: true),
      SchemaProperty('counterpartAccount', RealmPropertyType.string,
          optional: true),
      SchemaProperty('counterpartCardNumber', RealmPropertyType.string,
          optional: true),
      SchemaProperty('counterpartName', RealmPropertyType.string,
          optional: true),
      SchemaProperty('counterpartBankName', RealmPropertyType.string,
          optional: true),
      SchemaProperty('country', RealmPropertyType.string, optional: true),
      SchemaProperty('currency', RealmPropertyType.string, optional: true),
      SchemaProperty('isOrder', RealmPropertyType.bool),
      SchemaProperty('includedIncomeExpenditure', RealmPropertyType.bool),
      SchemaProperty('summary', RealmPropertyType.string, optional: true),
      SchemaProperty('place', RealmPropertyType.string, optional: true),
      SchemaProperty('accountingAmount', RealmPropertyType.double),
      SchemaProperty('remark', RealmPropertyType.string, optional: true),
      SchemaProperty('info', RealmPropertyType.string, optional: true),
      SchemaProperty('postscript', RealmPropertyType.string, optional: true),
      SchemaProperty('timestamp', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
