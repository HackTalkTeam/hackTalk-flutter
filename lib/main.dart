import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/utils/app_themes.dart';
import 'core/helpers/cache_helper.dart';
import 'core/helpers/dio_helper.dart';
import 'features/auth/logic/app_cubit/app_cubit.dart';
import 'features/drawer/setting/contact_us/view/screen/contact_us_screen.dart';
import 'features/drawer/setting/personal_information/personal_information_screen.dart';
import 'features/drawer/setting/setting/view/screens/setting_screen.dart';
import 'features/home/presentation/screen/home/home_screen.dart';
import 'features/welcome/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
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
            home:  const HomeScreen(),
          ),
        );
      },
    );
  }
}
