import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/navbar_screens/navbar.dart';
import 'package:khidma_pro/widgets/buttons.dart';

import '../authentication/login.dart';
import '../consts/text_styles.dart';

class PendingApproval extends StatelessWidget {
  const PendingApproval({super.key});

  // A placeholder function to check if the account is verified
  bool isAccountVerified() {
    // Replace this with the actual logic for checking account verification
    return true; // Assuming the account is not verified
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Pending Approval',
                style: jost600(32.sp, Color(0xff6B7280)),
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'Thank you for registering with Repairoo. A member of the team will approve your request shortly.',
              textAlign: TextAlign.center,
              style: jost400(20.sp, Color(0xff656F77)),
            ),
            SizedBox(height: 80.h),
      //      Image.asset(AppImages.logo),
            SizedBox(height: 142.h),
            CustomButton(
              text: 'Go Home',
              textColor: backgroundColor,
              onPressed: () {
                if (isAccountVerified()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomBar()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text('Account Not Verified'),
                        content: Text(
                          'Your account has not been verified. Please contact us for assistance.',
                          style: jost400(18.sp, Color(0xff656F77)),
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              'Close',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
          //    backgroundColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
