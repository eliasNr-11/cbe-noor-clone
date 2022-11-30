import 'package:cbe_noor_clone/constants.dart';
import 'package:cbe_noor_clone/views/accounts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentsPage extends StatelessWidget {
  const RecentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                'Recent transactions',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: primaryColor,
                ),
              ),
            ),
            const TransactionList()
          ],
        ),
      ),
    );
  }
}
