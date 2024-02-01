
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myvinmec/data/model/icon_model.dart';
import 'package:myvinmec/screen/splass/widget/circle_widget.dart';
import 'package:myvinmec/utils/style.dart';

import '../../../utils/color.dart';

class ItemAppbarBody extends StatelessWidget {
  ItemAppbarBody({super.key, required this.item});

  IconModel item;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            DottedBorder(
              borderType: BorderType.Circle,
              color: item.isSelect == true ? Colors.red : Colors.transparent,
              child: CircleWidget(
                color: primaryColor.withOpacity(0.1),
                padding: const EdgeInsets.all(12),
                size: 55,
                  child: Image.asset(item.img)
              ),
            ),
            Text(item.name, style: styleBody.copyWith(fontSize: 12), maxLines: 2, textAlign: TextAlign.center,)
          ],
        ),
        if(item.isSelect == true)
          Positioned(
            top: 0,
            right: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(30))
              ),
              child: Text("new", style: styleBodyBold.copyWith(color: Colors.white, fontSize: 10),),
            ),
          ),
      ],
    );
  }
}
