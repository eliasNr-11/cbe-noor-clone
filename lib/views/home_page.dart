import 'package:cbe_noor_clone/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List> btns = [
      ['Transfer', Icons.sync],
      ['People', Icons.people],
      ['Utilities', Icons.clean_hands],
      ['Top Up', Icons.aod_rounded],
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BalanceCard(),
          SizedBox(height: 20.h),
          Icon(
            Icons.circle,
            size: 14.sp,
            color: Colors.green,
          ),
          SizedBox(height: 10.h),
          Text(
            'Services',
            style: TextStyle(fontSize: 18.sp, color: primaryColor),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: btns.length,
                  itemBuilder: (BuildContext context, index) {
                    return TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 1.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(btns[index][1], size: 42.sp,),
                          SizedBox(height: 10.h),
                          Text(btns[index][0], style: TextStyle(fontSize: 18.sp),),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class BalanceCard extends StatefulWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240.h,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/card.jpg'),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Balance",
              style: TextStyle(fontSize: 18.sp, color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_isVisible ? '65,000' : '*****'} Birr',
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.grey,
                      size: 28.sp,
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Wadiah   - 1000${_isVisible ? '12345' : '*****'}6789',
              style: TextStyle(fontSize: 18.sp, color: Colors.yellow),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                DateFormat('MMM d, yyyy  h:mm:ss a').format(DateTime.now()),
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
