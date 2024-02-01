
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myvinmec/data/model/icon_model.dart';
import 'package:myvinmec/utils/color.dart';
import 'package:myvinmec/utils/style.dart';

class ItemInfo extends StatelessWidget {
  ItemInfo({super.key, required this.data});

  IconModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: myDecoration,
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Image.asset(data.img, width: 30, height: 30,),
          Text(data.name, style: styleBodyNote.copyWith(color: Colors.grey, fontSize: 12), maxLines: 2, textAlign: TextAlign.center),
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
