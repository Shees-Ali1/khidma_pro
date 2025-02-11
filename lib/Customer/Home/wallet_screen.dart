import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidma_pro/app_bar/CAppBar.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/images.dart';


import '../../app_bar/CustomAppBar.dart';
import '../../authentication/role_screen.dart';
import '../../consts/text_styles.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CAppBar(isMenu: false, isNotification: false, isTitle: true, isSecondIcon: false,title: 'Wallet',onBackTap: (){},),
      backgroundColor: backgroundColor,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                // alignment: Alignment.topLeft,
                children: [
                  Image.asset(wallet_back),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 18.w, vertical: 19.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: 20.h,),
                        Text(
                          'Available Balance',
                          style: GoogleFonts.inter(  // Replace 'Roboto' with any font you like
                            fontSize: 14.87.sp,
                            fontWeight: FontWeight.w600,
                            color: skyblue
                          ),
                        ),
                        SizedBox(
                          height: 6.25.h,
                        ),
                        Text(
                          '79.00 AED',
                          style: GoogleFonts.inter(  // Replace 'Roboto' with any font you like
                            fontSize: 35.65.sp,
                            fontWeight: FontWeight.w700,
                            color: skyblue
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 110,
                      right: 0.w,
                      left: 0.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 11.h),
                        margin: EdgeInsets.symmetric(horizontal: 25.w),
                        width: 304.11.w,
                        // height: 61.15.h,
                        decoration: BoxDecoration(
                            color: skyblue,
                            borderRadius: BorderRadius.circular(12.4.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text('Add Money',
                                    style: jost400(12.sp, whiteColor)),
                              ],
                            ),
                            SizedBox(
                              width: 70.w,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                    height: 22.h,
                                    width: 22.w,
                                    child: Image.asset(history)),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text('History',
                                    style: jost400(12.sp, whiteColor)),
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                        width: 308.w,
                        // height: 61.15.h,
                        decoration: BoxDecoration(
                            color: skyblue,
                            borderRadius: BorderRadius.circular(10.52.r)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_box_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 17.66.w,
                            ),
                            Text('Add New Card',
                                style: jost400(14.sp, whiteColor)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Text('Transactions', style: jost700(26.35.sp, skyblue)),
                    SizedBox(
                      height: 13.h,
                    ),
                    Text('Today', style: jost400(13.17.sp, skyblue)),
                    SizedBox(
                      height: 13.h,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 28.1.w,
                        height: 28.1.h,
                        decoration: BoxDecoration(
                            color: skyblue,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(arrow_right),
                              scale: 4,
                            )),
                      ),
                      title: Text(
                        'Credit',
                        style: jost400(13.17, skyblue),
                      ),
                      subtitle: Text('To Starbucks',
                          style: jost400(12.17, skyblue)),
                      trailing:
                      Text('\$ 3,110', style: jost500(14.17, skyblue)),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 28.1.w,
                        height: 28.1.h,
                        decoration: BoxDecoration(
                            color: skyblue,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(arrow_right),
                              scale: 4,
                            )),
                      ),
                      title: Text(
                        'Transfer',
                        style: jost400(13.17, skyblue),
                      ),
                      subtitle: Text('To Starbucks',
                          style: jost400(12.17, skyblue)),
                      trailing:
                      Text('\$ 3,110', style: jost500(14.17, skyblue)),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Text('Yesterday', style: jost400(13.17.sp, skyblue)),
                    SizedBox(
                      height: 13.h,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 28.1.w,
                        height: 28.1.h,
                        decoration: BoxDecoration(
                            color: skyblue,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(arrow_right),
                              scale: 4,
                            )),
                      ),
                      title: Text(
                        'Transfer',
                        style: jost400(13.17, skyblue),
                      ),
                      subtitle: Text('To Starbucks',
                          style: jost400(12.17, skyblue)),
                      trailing:
                      Text('\$ 3,110', style: jost500(14.17, skyblue)),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 28.1.w,
                        height: 28.1.h,
                        decoration: BoxDecoration(
                            color: skyblue,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(arrow_right),
                              scale: 4,
                            )),
                      ),
                      title: Text(
                        'Transfer',
                        style: jost400(13.17, skyblue),
                      ),
                      subtitle: Text('To Starbucks',
                          style: jost400(12.17, skyblue)),
                      trailing:
                      Text('\$ 3,110', style: jost500(14.17, skyblue)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
