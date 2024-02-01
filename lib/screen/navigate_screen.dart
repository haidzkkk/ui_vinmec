
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myvinmec/screen/orther_screen/account_screen.dart';
import 'package:myvinmec/screen/orther_screen/book_screen.dart';
import 'package:myvinmec/screen/orther_screen/notify_screen.dart';
import 'package:myvinmec/screen/orther_screen/profile_screen.dart';
import 'package:myvinmec/utils/color.dart';
import 'package:myvinmec/utils/data_source.dart';
import 'package:myvinmec/utils/style.dart';
import 'package:showcaseview/showcaseview.dart';

import 'home/home_screen.dart';
import 'home/widget/showcase_widget.dart';

class NavigateScreen extends StatefulWidget {
  const NavigateScreen({super.key});

  @override
  State<NavigateScreen> createState() => NavigateScreenState();

}

class NavigateScreenState extends State<NavigateScreen> {

  int currentScreen = 0;

  var screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const BookScreen(),
    const NotifyScreen(),
    const AccountScreen(),
  ];

  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey three = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context)
            .startShowCase([_one, _two, three]));
  }

  static NavigateScreenState of(BuildContext context) {
    final state = context.findAncestorStateOfType<NavigateScreenState>();
    if (state != null) {
      return state;
    } else {
      throw Exception('Please provide ShowCaseView context');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomShowCaseWidget(
        keyShow: _one,
        title: 'Trải nghiệm ngay đặt lịch tự động để chọn bác sẽ ngày khám, giờ khám tiện lợi!',
        action: InkWell(
          onTap: (){
            ShowCaseWidget.of(context).next();
          },
            child: Icon(Icons.arrow_forward, color: primaryColor,)
        ),
        positionCusor: MediaQuery.of(context).size.width * 0.34,
        isTop: true,
        index: 1,
        totalIndex: 3,
        child: InkWell(
          highlightColor: Colors.transparent,
          onTap: (){
            WidgetsBinding.instance.addPostFrameCallback((_) =>
                ShowCaseWidget.of(context)
                    .startShowCase([_one, _two, three]));
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white, width: 2)
            ),
            child: const Icon(Icons.calendar_month, size: 30, color: Colors.white,),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        height:60,
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: itemBottomNav(
                imgSelect: "${assetsSource}home_select.png",
                imgUnSelect: "${assetsSource}home_unselect.png",
                name: "Trang chủ",
                onTap: () {
                  currentScreen = 0;
                  setState(() {});
                },
                isSelect: currentScreen == 0,
              ),
            ),
            Expanded(
              child: CustomShowCaseWidget(
                keyShow: _two,
                title: 'Kết nối hồ sơ y tế và bắt đầu xem kêt quả khám trực tuyến của bạn và gia đình!',
                positionCusor: MediaQuery.of(context).size.width * 0.13,
                action: InkWell(
                    onTap: (){
                      ShowCaseWidget.of(context).next();
                    },
                    child: Icon(Icons.arrow_forward, color: primaryColor,)),
                isTop: true,
                index: 2,
                totalIndex: 3,
                child: itemBottomNav(
                  imgSelect: "${assetsSource}usercard_select.png",
                  imgUnSelect: "${assetsSource}usercard_unselect.png",
                  name: "Hồ sơ",
                  onTap: () {
                    currentScreen = 1;
                    setState(() {});
                  },
                  isSelect: currentScreen == 1,
                  ),
              ),
            ),

            Expanded(
              child: itemBottomNav(
                name: "Đặt lịch",
                onTap: () {
                  currentScreen = 2;
                  setState(() {});
                },
                isSelect: currentScreen == 2,
              ),
            ),
            Expanded(
              child: itemBottomNav(
                imgSelect: "${assetsSource}notify_select.png",
                imgUnSelect: "${assetsSource}notify_unselect.png",
                name: "Thông báo",
                onTap: () {
                  currentScreen = 3;
                  setState(() {});
                },
                isSelect: currentScreen == 3,
              ),
            ),
            Expanded(
              child: itemBottomNav(
                imgSelect: "${assetsSource}person_select.png",
                imgUnSelect: "${assetsSource}person_unselect.png",
                name: "Tài khoản",
                onTap: () {
                  currentScreen = 4;
                  setState(() {});
                },
                isSelect: currentScreen == 4,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: screens[currentScreen],
      ),
    );
  }

  Widget itemBottomNav({String? imgSelect, String? imgUnSelect, required String name, required bool isSelect, required Function() onTap}){
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          if(imgSelect != null && imgUnSelect != null)
            isSelect
            ? Image.asset(imgSelect, width: 25,)
            : Image.asset(imgUnSelect, width: 25,),
          Text(
            name,
            style: styleBodyNote.copyWith(color: isSelect ? primaryColor : Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
