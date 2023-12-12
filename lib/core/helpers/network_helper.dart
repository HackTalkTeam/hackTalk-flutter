import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkHelper {
  Future<bool> get isInternetConnected;
}

class NetworkHelperImp implements NetworkHelper {
  final InternetConnection internetConnection;
  NetworkHelperImp({required this.internetConnection});

  @override
  Future<bool> get isInternetConnected async =>
      await internetConnection.hasInternetAccess;
}
