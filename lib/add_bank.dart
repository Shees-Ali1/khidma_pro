import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/text_styles.dart';
import 'package:khidma_pro/widgets/buttons.dart';
import 'package:khidma_pro/widgets/textfield.dart';

import 'app_bar/CAppBar.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CAppBar(isMenu: false, isNotification: false, isTitle: true, isSecondIcon: false,title: 'Wallet',onBackTap: (){},),

      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: skyblue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 3),
                      Text(
                        'Add Bank Account',
                        style: jost500(18.sp, whiteColor)
                      ),
                      const SizedBox(height: 3),
                      SizedBox(height: 26),
                      ExpansionTile(
                        backgroundColor: Colors.grey[200],
                        minTileHeight: 45.0,
                        collapsedIconColor: skyblue,
                        collapsedTextColor:skyblue,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.31),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        collapsedShape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.31),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        iconColor: skyblue,
                        textColor: skyblue,
                        title: Text(
                          'Bank Name',
                          style: TextStyle(color: skyblue, fontSize: 14),
                        ),
                        collapsedBackgroundColor: Colors.white,
                        children: [
                          Container(
                            height: 220.0,
                            child: Scrollbar(
                              thumbVisibility: true,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: 5, // Static number of items
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {},
                                    title: Text(
                                      'Bank ${index + 1}',
                                      style: TextStyle(color: skyblue, fontSize: 15, fontWeight: FontWeight.w700),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 11),

                      CustomInputField(
                        hintText: '   Full Name',
                        ),
                      const SizedBox(height: 11),

                      CustomInputField(
                        hintText: '   IBAN',
                      ),                      const SizedBox(height: 11),
                      CustomInputField(
                        hintText: '   Account Number',
                      ),                      const SizedBox(height: 11),

                      const SizedBox(height: 25),
CustomButton(text: 'Add', onPressed: (){},color: Colors.white,textColor: skyblue,height: 51.h,width: 311.w,)
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 23),
        ],
      ),
    );
  }
}
