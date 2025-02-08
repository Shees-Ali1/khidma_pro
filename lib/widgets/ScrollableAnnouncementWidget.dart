import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../consts/colors.dart';
import '../consts/images.dart';
import '../consts/text_styles.dart';
class Announcement {
  final String title;
  final String date;
  final String description;
  final String image;

  Announcement({
    required this.title,
    required this.date,
    required this.description,
    required this.image,
  });
}

class ScrollableAnnouncementWidget extends StatelessWidget {
  const ScrollableAnnouncementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Announcement> announcements = _getAnnouncements(); // List of dynamic announcements

    return Center(
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            width: 2,
            color: announcementMainContainerBorder,
          ),
          color: announcementMainContainer,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 92.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: announcements.map((announcement) {
                return _buildItem(announcement);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Announcement announcement) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Container(
        width: 212.w,
        height: 92.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: skyblue,
          border: Border.all(
            width: 2,
            color: announcementInnerContainerBorder
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(announcement.image, width: 19.w, height: 19.h),
                      Text(
                        announcement.title,
                        textAlign: TextAlign.center,
                        style: TextStyles.announcementsText(),
                      ),
                    ],
                  ),
                  Text(
                    announcement.date,
                    textAlign: TextAlign.center,
                    style: TextStyles.announcementsDateText(),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                announcement.description,
                textAlign: TextAlign.center,
                style: TextStyles.announcementsDateText(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Announcement> _getAnnouncements() {
    return [
      Announcement(
        title: 'Announcement 1',
        date: '16 Sep 2024',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt sagittis sapien, id lobortis metus. Morbi luctus, sapien sed aliquam vestibulum, arcu nibh fermentum',
        image: announcement, // Ensure the image path is correct
      ),
      Announcement(
        title: 'Announcement 2',
        date: '17 Sep 2024',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt sagittis sapien, id lobortis metus. Morbi luctus, sapien sed aliquam vestibulum, arcu nibh fermentum',
        image: announcement,
      ),
      Announcement(
        title: 'Announcement 3',
        date: '18 Sep 2024',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt sagittis sapien, id lobortis metus. Morbi luctus, sapien sed aliquam vestibulum, arcu nibh fermentum',
        image: announcement,
      ),
      // Add more announcements as needed
    ];
  }
}
