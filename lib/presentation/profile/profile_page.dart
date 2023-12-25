import 'package:cards_startup/presentation/add_question/confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double screenHeight = 844;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
                  child: Row(
                    children: [
                      Image.asset("assets/fi_menu.png"),
                      Spacer(),
                      Text(
                        'Все темы',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 27.sp,
                          fontFamily: 'Merriweather',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Image.asset("assets/Avatar 1.png")
                    ],
                  ),
                )
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.85.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFCFCAFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 140.w,
                              height: 140.h,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Set new photo',
                              style: TextStyle(
                                color: Color(0xFF383362),
                                fontSize: 14.25.sp,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h,),
                          Text(
                            'PERSONAL INFORMATION',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.25.sp,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          Container(
                            width: 368.w,
                            height: 79.h,
                            padding: EdgeInsets.all(8),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.25.sp,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Divider(
                                  height: 20.h,
                                  thickness: 2,
                                  color: Color(0xFFC7C7C7),
                                ),
                                Text(
                                  'Username',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.25.sp,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h,),
                          Text(
                            'GROUPS',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.25.sp,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          Container(
                            width: 368.w,
                            height: 79.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          Opacity(
                            opacity: 0.20,
                            child: Container(
                              width: 368.w,
                              height: 39.h,
                              padding: EdgeInsets.only(left: 8),
                              decoration: ShapeDecoration(
                                color: Colors.black.withOpacity(0.20000000298023224),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Questions',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.25.sp,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 60.h,),
                          Container(
                            width: 368.w,
                            height: 52.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Выйти из аккаунта',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFC23434),
                                  fontSize: 19.57.sp,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
