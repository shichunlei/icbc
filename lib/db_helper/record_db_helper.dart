import 'package:icbc/beans/income_expenditure_record.dart';
import 'package:icbc/db_helper/realm_manager.dart';
import 'package:icbc/realm/records.dart';
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
      // Log.e(e.toString());
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
      // Log.e("Realm Write Error: $e");
      // 可以在这里添加日志上报或其他错误处理逻辑
    }
  }
}
