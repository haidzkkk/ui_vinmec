
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myvinmec/utils/color.dart';
import 'package:myvinmec/utils/style.dart';

import '../../../utils/data_source.dart';

class ItemNotify extends StatelessWidget {
  ItemNotify({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: myDecoration,
          child: Center(
              child: Text(title, style: styleBody.copyWith(color: primaryColor, fontSize: 14), maxLines: 3,)
          ),
        ),
        Positioned(
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: myDecoration.copyWith(
              color: primaryColor,
              borderRadius: const BorderRadiusDirectional.all(Radius.circular(5))
            ),
            child: Row(
              children: [
                Image.asset("${assetsSource}comercial.png", width: 13,),
                const SizedBox(width: 2,),
                Text("Tin mới", style: styleBodyNote.copyWith(color: Colors.white),),
              ],
            ),
          ),
        )
      ],
    );
  }

  var myDecoration = BoxDecoration(
      color: primaryColor.withOpacity(0.15),
      borderRadius: const BorderRadiusDirectional.all(Radius.circular(10))
  );
}
