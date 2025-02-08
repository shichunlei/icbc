import 'package:icbc/beans/income_expenditure_record.dart';
import 'package:icbc/db_helper/realm_manager.dart';
import 'package:icbc/global/enum.dart';
import 'package:icbc/realm/records.dart';
import 'package:icbc/widgets/filter.dart';
import 'package:realm/realm.dart';

class RecordDbHelper {
  final Realm _realm;

  int i = 0;

  RecordDbHelper() : _realm = RealmManager().realm {
    if (_realm.isClosed) {
      throw Exception("RealmManager has not been properly initialized.");
    }
  }

  Future upsert(Records record) async {
    print("--->${record.toEJson()}");
    try {
      await safeWrite(() {
        _realm.add(record, update: false);
      });
    } catch (e) {
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${e.toString()}");
    }
  }

  /// 查询所有记录
  Future<List<IncomeExpenditureRecord>> queryAllRecords() async {
    try {
      return _realm.all<Records>().map((item) => realmToEntity(item)).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// 查询所有记录
  Future<List<IncomeExpenditureRecord>> queryRecordsByTime(
      {int? startTime,
      int? endTime,
      IncomeExpenditureType? type,
      int minMoney = 0,
      int? maxMoney,
      List<String> currencyIndex = const [],
      List<String> tradeTypeText = const []}) async {
    print("startTime------$startTime");
    print("endTime------$endTime");
    print("type------$type");
    print("minMoney------$minMoney");
    print("maxMoney------$maxMoney");

    List<String> _currency = [];

    if (currencyIndex.isNotEmpty) {
      _currency.addAll(currencyIndex);
    } else {
      _currency.addAll(currency);
    }

    print("--------------->${_currency.length}=================>${_currency.toList()}");

    List<String> _tradeTypeText = [];

    if (tradeTypeText.isNotEmpty) {
      _tradeTypeText.addAll(tradeTypeText);
    } else {
      _tradeTypeText.addAll(tradeType);
    }

    try {
      if (startTime != null && endTime != null && type == null) {
        return _realm
            .all<Records>()
            .query(r"timestamp >= $0 AND timestamp <= $1 AND money >= $2 AND TRUEPREDICATE SORT(timestamp DESC)",
                [startTime, endTime, minMoney])
            .where((item) => _currency.any((m) => m == item.currency) && _tradeTypeText.any((m) => m == item.title))
            .map((item) => realmToEntity(item))
            .toList();
      } else if (startTime == null && endTime == null && type != null) {
        return _realm
            .all<Records>()
            .query(r"type == $0 AND money >= $1 AND TRUEPREDICATE SORT(timestamp DESC)", [type.name, minMoney])
            .where((item) => _currency.any((m) => m == item.currency) && _tradeTypeText.any((m) => m == item.title))
            .map((item) => realmToEntity(item))
            .toList();
      } else if (startTime != null && endTime != null && type != null) {
        return _realm
            .all<Records>()
            .query(
                r"timestamp >= $0 AND timestamp <= $1 AND type == $2 AND money >= $3 AND TRUEPREDICATE SORT(timestamp DESC)",
                [startTime, endTime, type.name, minMoney])
            .where((item) => _currency.any((m) => m == item.currency) && _tradeTypeText.any((m) => m == item.title))
            .map((item) => realmToEntity(item))
            .toList();
      } else {
        List<IncomeExpenditureRecord> list = await queryAllRecords();
        return list
            .where((item) =>
                _currency.any((m) => m == item.currency) &&
                item.money >= minMoney &&
                _tradeTypeText.any((m) => m == item.title))
            .toList();
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// 查询所有记录
  Future<List<IncomeExpenditureRecord>> queryCurrentMothRecords() async {
    DateTime now = DateTime.now();
    try {
      return _realm
          .all<Records>()
          .query(r"timestamp >= $0 AND TRUEPREDICATE SORT(timestamp DESC)",
              [DateTime(now.year, now.month).millisecondsSinceEpoch])
          .map((item) => realmToEntity(item))
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// 获取最后的余额
  Future<num> queryLastRecords() async {
    RealmResults<Records> results = _realm.all<Records>().query(r"TRUEPREDICATE SORT(timestamp DESC)");
    return results.isNotEmpty ? results.first.balance : .0;
  }

  Future safeWrite(void Function() action) async {
    try {
      await _realm.writeAsync(action);
    } catch (e) {
      print("Realm Write Error: ${e.toString()}");
      // 可以在这里添加日志上报或其他错误处理逻辑
    }
  }
}
