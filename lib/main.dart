import 'package:cbe_noor_clone/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, bool isEn) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(isEn);
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', '');

  setLocale(bool isEn){
    setState(() {
      if (isEn) {
        _locale = const Locale('en', '');
      } else {
        _locale = const Locale('am', '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) {
          return MaterialApp(
              title: 'Flutter Demo',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: _locale,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.purple,
                textTheme: TextTheme(
                  bodyText2: TextStyle(fontSize: 14.sp),
                ),
                iconTheme: IconThemeData(size: 24.sp),
              ),
              home: const LoginPage());
        });
  }
}
