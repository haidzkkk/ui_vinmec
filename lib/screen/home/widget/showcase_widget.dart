
import 'package:flutter/material.dart';
import 'package:myvinmec/utils/color.dart';
import 'package:myvinmec/utils/style.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomShowCaseWidget extends StatelessWidget {

  CustomShowCaseWidget({
    super.key,
    required this.keyShow,
    required this.title,
    required this.child,
    required this.positionCusor,
    required this.isTop,
    this.totalIndex,
    this.index,
    this.action,
  });

  GlobalKey keyShow;
  String title;
  Widget child;
  int? totalIndex;
  int? index;
  double positionCusor;
  bool isTop;
  Widget? action;
  Function()? onAction;

  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
        key: keyShow,
        height: 0,
        width: positionCusor + 120,
        tooltipPosition: isTop ? TooltipPosition.top : TooltipPosition.bottom,
        disableMovingAnimation: true,
        targetBorderRadius: const BorderRadius.all(Radius.circular(200)),
        targetPadding: const EdgeInsets.all(3),
        targetShapeBorder: const CircleBorder(),
        overlayOpacity: 0.4,
        container: Container(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(10))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: styleBody,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if(totalIndex != null)
                          AnimatedSmoothIndicator(
                            activeIndex: index! - 1,
                            count: totalIndex!,
                            effect: SlideEffect(
                              dotWidth:  10.0,
                              dotHeight:  10.0,
                                dotColor:  Colors.grey,
                                activeDotColor: primaryColor
                            ),
                          ),
                        const SizedBox(),
                        if(action != null) action!
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: positionCusor,
                bottom: isTop ? -20 : null,
                top: !isTop ? -20 : null,
                child: Icon(
                  isTop ? Icons.arrow_drop_down_rounded : Icons.arrow_drop_up_rounded,
                  size: 60,
                  color: Colors.white,
                )
              ),
            ],
          ),
        ),
        child: child,
      );
  }
}
