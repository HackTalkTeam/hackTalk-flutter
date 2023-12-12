import 'package:hack_talk/features/welcome/domain/repositories/splash_repository.dart';

class AutoLoginUseCase{
  final SplashRepository splashRepository;
  AutoLoginUseCase({required this.splashRepository});

  Future call() async {
    splashRepository.autoLogin();
  }
}