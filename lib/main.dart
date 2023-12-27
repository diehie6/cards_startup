import 'package:cards_startup/presentation/add_question/add_question_page.dart';
import 'package:cards_startup/presentation/add_question/confirmation_page.dart';
import 'package:cards_startup/presentation/authorization/signin_page.dart';
import 'package:cards_startup/presentation/authorization/signup_page.dart';
import 'package:cards_startup/presentation/landing/landing_page.dart';
import 'package:cards_startup/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: AddQPage(),
    );
  }
}