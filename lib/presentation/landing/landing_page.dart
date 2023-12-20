import 'package:cards_startup/presentation/authorization/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  final PageController _pageController = PageController();
  final List<String> imgList = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
  ];

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width.w;
    double containerHeight = containerWidth * (480 / 415).h;

    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(37.r),
                    color: Color(0xFFCFCAFF),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(37.r),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: imgList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(imgList[index], fit: BoxFit.cover);
                      },
                      onPageChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _carouselController.animateToPage(entry.key),
                        child: Container(
                          width: _current == entry.key ? 24.0 : 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: _current == entry.key
                                ? Colors.white
                                : Color(0xFFB9B1FF),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            SizedBox(height: 30.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Winter',
                    style: TextStyle(
                      color: Color(0xFF2C2C2C),
                      fontSize: 36.sp,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Vacation Trips',
                    style: TextStyle(
                      color: Color(0xFF2C2C2C),
                      fontSize: 36.sp,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    'Enjoy your winter vacations with warmth\nand amazing sightseeing on the mountains.\nEnjoy the best experience with us!',
                    style: TextStyle(
                      color: Color(0xFF2C2C2C),
                      fontSize: 16.sp,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 40,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                    },
                    child: Container(
                      width: 181,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Color(0xFF6A62B6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Let’s Go!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Merriweather',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Image.asset("assets/arrow_left_long.png")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
