import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetWorkInfoImpl implements NetworkInfo {
  final DataConnectionChecker _dataConnectionChecker;
  NetWorkInfoImpl(this._dataConnectionChecker);
  @override
  Future<bool> get isConnected => _dataConnectionChecker.hasConnection;
}
