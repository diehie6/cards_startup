import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SwipeItem> _swipeItems = [];
  String finishedText = 'Вопросы на сегодня закончились';
  late MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = [
    "Посоветуйте,как мне быть! он сидит уже 3года,еще 2года осталось за убийство, убил мужика за то,что он изнасиловал его сестру! как вы думаете он может быть хорошим мужем и отцом,или нет? стоит мне с ним строить серьезные отношение?, sadadasdasdsaddsaddasndakhdawdadiawbiwabsdawibdwabdwahkbdakhbwdwaibdawhsbdajwhbdiawdawhiudhavsgjdgauiwhsbduawvdiuhasdbkawbiadsuhdbaoiwvdoiyashadoawivdoisavaowdisavoawvdi",
    "Посоветуйте,как мне быть! он сидит уже 3года,еще 2года осталось за убийство, убил мужика за то,что он изнасиловал его сестру! как вы думаете он может быть хорошим мужем и отцом,или нет? стоит мне с ним строить серьезные отношение?",
    "Посоветуйте,как мне быть! он сидит уже 3года,еще 2года осталось за убийство, убил мужика за то,что он изнасиловал его сестру! как вы думаете он может быть хорошим мужем и отцом,или нет? стоит мне с ним строить серьезные отношение?",
    "Посоветуйте,как мне быть! он сидит уже 3года,еще 2года осталось за убийство, убил мужика за то,что он изнасиловал его сестру! как вы думаете он может быть хорошим мужем и отцом,или нет? стоит мне с ним строить серьезные отношение?",
    "Посоветуйте,как мне быть! он сидит уже 3года,еще 2года осталось за убийство, убил мужика за то,что он изнасиловал его сестру! как вы думаете он может быть хорошим мужем и отцом,или нет? стоит мне с ним строить серьезные отношение?"
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i]),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 22, right: 22),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.table_rows),
                  Text(
                    'Все темы',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/44x44"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 189.h,
              ),
              Center(
                  child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                    Container(
                      width: 335,
                      height: 395,
                      child: SwipeCards(
                        matchEngine: _matchEngine,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.all(21),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              color: Color(0xffD0CBFF),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 86,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text('LOVE', style: TextStyle(
                                        color: Color(0xFF1C1C1C),
                                        fontSize: 11.13,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700,
                                      ),),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 13,),
                                SizedBox(
                                  height: 208,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 210,
                                    child: Text(
                                      _swipeItems[index].content.text,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Merriweather',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 62,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _matchEngine.currentItem?.nope();
                                        },
                                        child: Container(
                                          width: 88,
                                          height: 38,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF6A62B6),
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Center(
                                            child: Icon(
                                              Icons.thumb_down_alt_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _matchEngine.currentItem?.like();
                                        },
                                        child: Container(
                                          width: 88,
                                          height: 38,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF6A62B6),
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Center(
                                            child: Icon(
                                              Icons.thumb_up_alt_outlined,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        onStackFinished: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Stack Finished"),
                            duration: Duration(milliseconds: 500),
                          ));
                        },
                        itemChanged: (SwipeItem item, int index) {
                          print("item: ${item.content.text}, index: $index");
                        },
                        upSwipeAllowed: true,
                        fillSpace: true,
                      ),
                    ),
                  ])))
            ],
          ),
        ),
      ),
    );
  }
}

class Content {
  final String text;

  Content({required this.text});
}
