import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app_ageeza/core/theme/theme.dart';
import 'package:to_do_app_ageeza/featured/auth/presentation/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      designSize: Size(width, height),
      builder: (context, child) {
        return MaterialApp(
          title: 'To-Do App',
          theme: getAppTheme(),
          darkTheme: getAppTheme(),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}
