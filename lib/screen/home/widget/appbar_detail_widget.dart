
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myvinmec/screen/home/home_screen.dart';
import 'package:myvinmec/screen/home/widget/showcase_widget.dart';
import 'package:myvinmec/screen/navigate_screen.dart';
import 'package:myvinmec/screen/splass/widget/circle_widget.dart';
import 'package:myvinmec/utils/style.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../utils/color.dart';
import '../../../utils/data_source.dart';
import '../../splass/widget/item_appbar_body.dart';

class AppBarDetailWidget extends StatelessWidget {
  AppBarDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: BackgroundCliper(),
          child: Container(
            height: 400,
            color: primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                titleSpacing: 0.0,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("MyVinmec", style: styleTitleBold.copyWith(color: Colors.white),),
                    Text("Chăm sóc bằng cả tính mạng", style: styleBodyNote.copyWith(color: Colors.white),),
                  ],
                ),
                actions: appbarActionData.map((data) {
                  return CustomShowCaseWidget(
                    keyShow: data.isSelect == true
                        ? NavigateScreenState.of(context).three
                        : GlobalKey(),
                    title: 'Theo dõi chương trình ưu đãi hấp dẫn được cập nhật mỗi ngày!',
                    totalIndex: 3,
                    index: 3,
                    action: InkWell(
                        onTap: (){
                          ShowCaseWidget.of(context).dismiss();
                        },
                        child: Text("Trải nghiệm ngay", style: styleBody.copyWith(color: primaryColor),)),
                    positionCusor: MediaQuery.of(context).size.width * 0.61,
                    isTop: false,
                    child: CircleWidget(
                        isFocus: data.isSelect,
                        size: 35,
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(data.img)
                    ),
                  );
                }).toList()
              ),
              const SizedBox(height: 20,),
              Container(
                height: 150,
                clipBehavior: Clip.hardEdge,
                decoration: myBoxDecoration.copyWith(boxShadow: []),
                child: CarouselSlider.builder(
                    itemCount: bannerData.length,
                    itemBuilder: (context, index, realIndex){
                      return Image.asset(bannerData[index], fit: BoxFit.cover,);
                    },
                    options: CarouselOptions(
                      initialPage: 0,
                      height: double.infinity,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 10),
                      disableCenter: true,
                    )
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(10),
                clipBehavior: Clip.hardEdge,
                decoration: myBoxDecoration,
                alignment: Alignment.center,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: (3/4),
                  ),
                  itemCount: appbarBodyData.length > 8 ? 8 : appbarBodyData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemAppbarBody(item: appbarBodyData[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  var myBoxDecoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 3,
          offset: Offset(0, 2)
        )
      ]
  );
}


class BackgroundCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
