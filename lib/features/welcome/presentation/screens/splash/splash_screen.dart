import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/welcome/presentation/logic/splash_cubit/splash_cubit.dart';
import 'package:hack_talk/features/welcome/presentation/screens/onBoarding/onBoarding_screen.dart';
import 'package:hack_talk/core/widgets/logo_widget.dart';
import 'package:hack_talk/injections.dart' as dep_inj;

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => dep_inj.inj(),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is NextPageState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              print(timeStamp);
              AppRoutes.routeAndRemoveAllTo(context, const OnBoardingScreen());
            });
          }
        },
        builder: (context, state) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LogoWidget(
                    isBigger: true,
                  ),
                  SizedBox(height: 16),
                  TextWidget.bigTitle(AppStrings.appName),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
