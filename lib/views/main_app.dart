import 'package:cbe_noor_clone/constants.dart';
import 'package:cbe_noor_clone/main.dart';
import 'package:cbe_noor_clone/views/accounts_page.dart';
import 'package:cbe_noor_clone/views/home_page.dart';
import 'package:cbe_noor_clone/views/login_page.dart';
import 'package:cbe_noor_clone/views/recents_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  int _selectedIndex = 0;
  static const List pages = [
    HomePage(),
    AccountsPage(),
    RecentsPage(),
  ];

  bool _switch = true;
  bool _isEn = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return false;
        } else {
          return true;
        }
      },
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover)),
        child: Scaffold(
          key: _key,
          drawerEnableOpenDragGesture: _selectedIndex != 0 ? false : true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: InkWell(
              borderRadius: BorderRadius.circular(50.r),
              splashColor: primaryColor.withOpacity(0.2),
              highlightColor: primaryColor.withOpacity(0.1),
              onTap: () {
                if (_selectedIndex != 0) {
                  setState(() {
                    _selectedIndex = 0;
                  });
                } else {
                  _key.currentState?.openDrawer();
                }
              },
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, anim) => RotationTransition(
                        turns: child.key == ValueKey('icon1')
                            ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                            : Tween<double>(begin: 0.75, end: 1).animate(anim),
                        child: FadeTransition(opacity: anim, child: child),
                      ),
                  child: _selectedIndex != 0
                      ? Icon(Icons.arrow_upward, key: const ValueKey('icon1'))
                      : Icon(
                          Icons.menu,
                          key: const ValueKey('icon2'),
                        )),
            ),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            foregroundColor: primaryColor,
            elevation: 0,
            actions: [
              TextButton(
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
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r)),
                    fixedSize: Size(55.r, 35.r),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: Size.zero),
                child: Icon(
                  Icons.refresh,
                  size: 26.sp,
                ),
              ),
            ],
          ),
          body: pages[_selectedIndex],
          drawer: Drawer(
            width: MediaQuery.of(context).size.width - 90.w,
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/drawerImg.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: SizedBox(),
                ),
                ListTile(
                  leading: Icon(
                    Icons.password,
                    color: primaryColor,
                    size: 28.sp,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.changePin,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.devices_rounded,
                    color: primaryColor,
                    size: 28.sp,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.unsubscribe,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.power_settings_new,
                    color: primaryColor,
                    size: 28.sp,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.logout,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.info_outlined,
                    color: primaryColor,
                    size: 28.sp,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.about,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.star_border,
                    color: primaryColor,
                    size: 28.sp,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.rateThisApp,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.price_change_outlined,
                    color: primaryColor,
                    size: 28.sp,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.cbeNoor,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  trailing: Switch(
                    activeColor: secondaryColor,
                    inactiveThumbColor: Colors.grey[300],
                    value: _switch,
                    onChanged: (val) {
                      setState(() {
                        _switch = !_switch;
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: const Icon(Icons.apps), label: AppLocalizations.of(context)!.home),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.account_balance), label: AppLocalizations.of(context)!.accounts),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.history), label: AppLocalizations.of(context)!.recents),
            ],
            selectedFontSize: 16.sp,
            unselectedFontSize: 14.sp,
            iconSize: 28.sp,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[300],
            backgroundColor: primaryColor,
            onTap: (val) {
              setState(() {
                _selectedIndex = val;
              });
            },
          ),
        ),
      ),
    );
  }
}
