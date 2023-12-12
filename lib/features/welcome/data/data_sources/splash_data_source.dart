import 'package:hack_talk/core/helpers/dio_helper.dart';
import 'package:hack_talk/core/helpers/network_helper.dart';

abstract class SplashDataSource {
  autoLogin() {}
}

class SplashDataSourceImp implements SplashDataSource {
  final DioHelper dioHelper;
  final NetworkHelper networkHelper;
  SplashDataSourceImp({required this.dioHelper, required this.networkHelper});

  @override
  autoLogin() async {
    bool isConnected = await networkHelper.isInternetConnected;
    if (isConnected) {
      // await dioHelper.getDio();
    } else {
      /// Connection Exception
    }
    throw UnimplementedError();
  }
}
