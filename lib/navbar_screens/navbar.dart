import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Service-Provider/Home/home_page.dart';
import '../consts/colors.dart';
import '../consts/images.dart';
import '../consts/text_styles.dart';
import '../home_screen.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomePage(),
    const BookingScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CircleNavBar(
        activeIndex: currentIndex,
        activeIcons: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(home, width: 22.w, height: 22.h, color: backgroundColor),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(booking,width: 22.w, height: 22.h,  color: backgroundColor),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(chat, width: 22.w, height: 22.h,  color: backgroundColor),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(profile, width: 22.w, height: 22.h,  color: backgroundColor),
          ),
        ],
        inactiveIcons: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(home, width: 28.w, height: 28.h,  color: backgroundColor),
              SizedBox(height:8.87.h ,),
              Text(
                "Home",
                style: TextStyles.bottomNavText(), // Use the text style here
                textAlign: TextAlign.center, // Apply text alignment directly here
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(booking,  width: 28.w, height: 28.h,  color: backgroundColor),
              SizedBox(height:8.87.h ,),
              Text(
                "Booking",
                style: TextStyles.bottomNavText(),
                textAlign: TextAlign.center, // Apply text alignment directly here
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(chat,  width: 28.w, height: 28.h, color: backgroundColor),
              SizedBox(height:8.87.h ,),
              Text(
                "Chat",
                style: TextStyles.bottomNavText(),
                textAlign: TextAlign.center, // Apply text alignment directly here
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(profile,  width: 28.w, height: 28.h, color: backgroundColor),
              SizedBox(height:8.87.h ,),
              Text(
                "Profile",
                style: TextStyles.bottomNavText(),
                textAlign: TextAlign.center, // Apply text alignment directly here
              ),
            ],
          ),
        ],
        color: Colors.white,
        circleColor: Colors.white,
        height: 60,
        circleWidth: 50,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.white,
        circleShadowColor: Colors.white,

        elevation: 10,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [skyblue, skyblue],
        ),
        circleGradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [skyblue, skyblue],
        ),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

// Screens for Navigation

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Booking Screen", style: TextStyle(fontSize: 24))),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Chat Screen", style: TextStyle(fontSize: 24))),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Profile Screen", style: TextStyle(fontSize: 24))),
    );
  }
}
