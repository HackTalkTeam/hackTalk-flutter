import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hack_talk/core/helpers/helper_methods.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/utils/app_themes.dart';
import 'package:hack_talk/features/welcome/screens/splash/splash_screen.dart';
import 'core/helpers/cache_helper.dart';
import 'core/helpers/dio_helper.dart';
import 'features/auth/logic/app_cubit/app_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
  await DioHelper.init();
  // for fixing font in APk.
  LicenseRegistry.addLicense(
        () async* {
      final license = await rootBundle.loadString('assets/fonts/Roboto/OFL.txt');
      yield LicenseEntryWithLineBreaks(
        ['assets/fonts/Roboto'],
        license,
      );
    },
  );
  // for store Svg in memory.
  HelperMethods.svgPrecacheImage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => AppCubit(),
          child: MaterialApp(
            navigatorKey: AppNavigator.navigatorKey,
            title: AppStrings.appName,
            theme: AppThemes.theme,
            debugShowCheckedModeBanner: false,
            home:  const SplashScreen(),
          ),
        );
      },
    );
  }
}
