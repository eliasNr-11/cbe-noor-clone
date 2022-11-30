import 'package:cbe_noor_clone/constants.dart';
import 'package:cbe_noor_clone/models/transaction_model.dart';
import 'package:cbe_noor_clone/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                'Accounts',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: primaryColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const BalanceCard(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Icon(
                Icons.circle,
                size: 14.sp,
                color: Colors.green,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recents',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: const TransactionList(),
            )
          ],
        ),
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: 10.h, top: 5.h, right: 20.w, left: 20.w),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, // Your desired background color
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 6.r),
                ]),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: transactions[index].isWithdraw
                      ? Colors.red[50]
                      : Colors.green[50],
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: transactions[index].isWithdraw
                    ? const Icon(
                        Icons.arrow_upward,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.arrow_downward,
                        color: Colors.green,
                      ),
              ),
              title: Text(
                transactions[index].isWithdraw ? 'Withdrawal' : 'Deposit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: primaryColor,
                ),
              ),
              subtitle: Text(
                DateFormat('MMM d, yyyy').format(transactions[index].transDate),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    transactions[index].price,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(transactions[index].transMethod,
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
