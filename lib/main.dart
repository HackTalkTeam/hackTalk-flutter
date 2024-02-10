import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:hack_talk/core/utils/app_themes.dart';
import 'package:hack_talk/features/auth/sign_up/sign_up_screen.dart';
import 'package:hack_talk/injections.dart' as dep_inj;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep_inj.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppStrings.appName,
        theme: AppThemes.theme,
        debugShowCheckedModeBanner: false,
        home:  const SignUpScreen(),
      ),
    );
  }
}
