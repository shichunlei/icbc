import 'package:icbc/realm/records.dart';
import 'package:realm/realm.dart';

class RealmManager {
  static final RealmManager _instance = RealmManager._internal();
  Realm? _realm;

  factory RealmManager() {
    return _instance;
  }

  RealmManager._internal();

  void initialize() async {
    var config = Configuration.local([
      Records.schema,
    ], schemaVersion: 1, migrationCallback: (Migration migration, int oldSchemaVersion) async {});
    if (_realm == null || _realm!.isClosed) {
      _realm = Realm(config);
    }

    Realm.logger.setLogLevel(LogLevel.all, category: LogCategory.realm);
  }

  Realm get realm {
    if (_realm == null || _realm!.isClosed) initialize();
    return _realm!;
  }

  void close() {
    if (_realm != null && !_realm!.isClosed) {
      _realm!.close();
      _realm = null; // 清除引用以确保可以重新初始化
    }
  }
}
