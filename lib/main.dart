import 'package:cbe_noor_clone/constants.dart';
import 'package:cbe_noor_clone/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.purple,
            textTheme: TextTheme(
              bodyText2: TextStyle(fontSize: 14.sp),
            ),
            iconTheme: IconThemeData(
              size: 24.sp
            ),
          ),
          home: const LoginPage()
        );
      }
    );
  }
}