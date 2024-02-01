
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myvinmec/data/model/icon_model.dart';
import 'package:myvinmec/data/model/item_model.dart';
import 'package:myvinmec/utils/color.dart';
import 'package:myvinmec/utils/style.dart';

class ItemQuestion extends StatelessWidget {
  ItemQuestion({super.key, required this.data});

  IconModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: myDecoration,
      child: Row(
        children: [
          const SizedBox(width: 10,),
          Image.asset(data.img, width: 30, height: 30,),
          const SizedBox(width: 10,),
          Expanded(
            child:
            Text(data.name, style: styleBodyBold.copyWith(fontSize: 14), maxLines: 2,),
          ),
        ],
      ),
    );
  }

  var myDecoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(0, 2)
        )
      ]
  );
}
