import 'package:cbe_noor_clone/constants.dart';
import 'package:cbe_noor_clone/main.dart';
import 'package:cbe_noor_clone/views/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pinController = TextEditingController();

  bool _validate = false;
  bool _isEn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isEn = !_isEn;
                });
                MyApp.setLocale(context, _isEn);
              },
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r)),
                  fixedSize: Size(55.r, 35.r),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size.zero),
              child: Text(!_isEn ? 'EN' : 'አማ'),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
            
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 150.w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Text(
                            AppLocalizations.of(context)!.welcome,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.cbeNoor,
                          style: TextStyle(color: primaryColor, fontSize: 18.sp),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: Text(
                            AppLocalizations.of(context)!.pin,
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.h),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: pinController,
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                                counterText: '',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor, width: 2),
                                ),
                                errorText:pinController.text.isEmpty ? null : _validate ? null : 'Invalid password'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: TextButton(
                            onPressed: () {
                              if (pinController.text != '0000') {
                                setState(() {
                                  _validate = false;
                                });
                              } else {
                                setState(() {
                                  _validate = true;
                                });
                              }
                          
                              if(_validate){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainApp()));
                              }
                            },
                            style: TextButton.styleFrom(
                                elevation: 6,
                                padding: EdgeInsets.only(
                                    top: 20.r, bottom: 20.r, left: 21.r, right: 19.r),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: Size.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.r)),
                                backgroundColor: secondaryColor,
                                primary: Colors.white),
                            child: Icon(Icons.arrow_forward_ios, size: 18.sp),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 60.h, top: 40.h),
                      child: Text(
                        AppLocalizations.of(context)!.copyright,
                        style: TextStyle(fontSize: 16.sp, color: primaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
