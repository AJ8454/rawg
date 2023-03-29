import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectioChecker;

  NetworkInfoImpl(this.internetConnectioChecker);

  @override
  Future<bool> get isConnected => internetConnectioChecker.hasConnection;
}
