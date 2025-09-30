import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(600, 960),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            scaffoldBackgroundColor: bgColor,
            useMaterial3: true,
            textTheme:
                GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
                    .apply(
                      bodyColor: Colors.white,
                    )
                    .copyWith(
                      bodyLarge: const TextStyle(color: bodyTextColor),
                      bodyMedium: const TextStyle(color: bodyTextColor),
                    ),
          ),
          routerConfig: AppRouter.router),
    );
  }
}
