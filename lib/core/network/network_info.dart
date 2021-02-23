// Package imports:
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:injectable/injectable.dart';

// Nos informa si contamos con internet .

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
