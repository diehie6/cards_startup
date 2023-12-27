import 'package:cards_startup/presentation/add_question/confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddQPage extends StatefulWidget {
  const AddQPage({Key? key}) : super(key: key);

  @override
  State<AddQPage> createState() => _AddQPageState();
}

class _AddQPageState extends State<AddQPage> {
  GlobalKey categoryKey = GlobalKey();
  LayerLink _layerLink = LayerLink();
  double screenHeight = 844;
  String selectedCategory = 'Категория';
  OverlayEntry? _overlayEntry;
  String? selectedLabel;
  bool _isMenuOpen = false;

  void showDropdown() {
    if (_overlayEntry != null) {
      removeOverlay();
    } else {
      _overlayEntry = _createDropdownOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
    }
  }

  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createDropdownOverlayEntry() {
    final RenderBox renderBox = categoryKey.currentContext?.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    return OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          left: offset.dx,
          top: offset.dy + size.height - 8,
          width: size.width,
          child: Material(
            elevation: 8.0,
            color: Color(0xFFCFCAFF),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)
            ),
            child: Wrap(
              children: <String>['Здоровье', 'Карьера', 'Отношения', 'NU community', 'AIESEC', 'KAZGUU'].map((String label) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
                      child: buildLabel(label, setState),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget buildLabel(String label, StateSetter dropdownSetState) {
    bool isSelected = label == selectedLabel;
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 16.sp,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: isSelected,
      onSelected: (bool selected) {
        dropdownSetState(() {
          selectedLabel = label;
        });
        setState(() {
          selectedCategory = label;
        });
        removeOverlay();
      },
      showCheckmark: false,
      backgroundColor: Colors.white,
      selectedColor: Color(0xFF6A62B6),
      checkmarkColor: Colors.white,
      avatar: null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  void _togglePopupMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

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
                      PopupMenuButton<String>(
                        onSelected: (String value) {
                          _togglePopupMenu();
                          // Handle your menu tap here
                        },
                        onCanceled: _togglePopupMenu,
                        itemBuilder: (BuildContext context) {
                          _togglePopupMenu(); // Open the popup menu
                          return <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'support',
                              child: Text(
                                'support',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.25.sp,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const PopupMenuDivider(),
                            PopupMenuItem<String>(
                              value: 'language',
                              child: Text(
                                'language',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.25.sp,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const PopupMenuDivider(),
                            PopupMenuItem<String>(
                              value: 'notifications',
                              child: Text(
                                'notifications',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.25.sp,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ];
                        },
                        child: Image.asset("assets/fi_menu.png"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
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
                  color: Color(0xFF6A62B6),
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
                          Container(
                            width: 144.w,
                            height: 26.h,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9.71.r),
                              ),
                            ),
                            child: Text(
                              'Добавить вопрос',
                              style: TextStyle(
                                color: Color(0xFF1C1C1C),
                                fontSize: 11.13.sp,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          GestureDetector(
                            onTap: () {
                              showDropdown();
                            },
                            child: CompositedTransformTarget(
                              key: categoryKey,
                              link: _layerLink,
                              child: Container(
                                width: 388.w,
                                height: 56.h,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      selectedCategory,
                                      style: TextStyle(
                                        color: Color(0xFF1C1C1C),
                                        fontSize: 20.sp,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_down_outlined),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.70.h,
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
                      Container(
                        width: 416.w,
                        height: 432.h,
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                            'Подходящий день для того, чтобы размышлять о будущем, строить планы, обсуждать их с людьми, разделяющими ваши цели и взгляды. Не исключено, что давние знакомые поделятся с вами ценной информацией или предложат что-то интересное. Вы не станете фантазировать, будете реально смотреть на вещи; это поможет избежать ошибок и разочарований.\nВероятны денежные поступления, в том числе – из неожиданных источников. Вы не станете сразу тратить полученное, и это будет верным решением. Некоторые Весы получат хорошие новости издалека.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.16.sp,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPage()));
                        },
                        child: Center(
                          child: Container(
                            width: 251.w,
                            height: 68.h,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19),
                              ),
                            ),
                            child: Text(
                              'Опубликовать',
                              style: TextStyle(
                                color: Color(0xFF524C8F),
                                fontSize: 25.49.sp,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
            if (_isMenuOpen)
              Positioned.fill(
                child: GestureDetector(
                  onTap: _togglePopupMenu,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
