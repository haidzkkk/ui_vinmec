
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CircleWidget extends StatelessWidget {
  CircleWidget({
    super.key,
    this.child,
    this.size,
    this.color,
    this.padding,
    this.isFocus,
  });

  Widget? child;
  Color? color;
  double? size;
  EdgeInsets? padding;
  bool? isFocus;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if(isFocus == true)
          Lottie.asset(
              "assets/icons/event.json",
          ),
        ClipOval(
            child: Container(
                height: size ?? 30,
                width: size ?? 30,
                color: color ?? Colors.white,
                padding: padding ?? const EdgeInsets.all(2),
                child: child
            )
        ),
      ],
    );
  }
}
