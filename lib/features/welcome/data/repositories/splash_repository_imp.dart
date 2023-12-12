import 'package:hack_talk/features/welcome/data/data_sources/splash_data_source.dart';
import 'package:hack_talk/features/welcome/domain/repositories/splash_repository.dart';

class SplashRepositoryImp implements SplashRepository{
  final SplashDataSource splashDataSource;

  SplashRepositoryImp({required this.splashDataSource});

  @override
  autoLogin()async {
    await splashDataSource.autoLogin();
  }
}