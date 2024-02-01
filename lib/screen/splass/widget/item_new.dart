
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myvinmec/data/model/icon_model.dart';
import 'package:myvinmec/data/model/item_model.dart';
import 'package:myvinmec/utils/color.dart';
import 'package:myvinmec/utils/style.dart';

class ItemNew extends StatelessWidget {
  ItemNew({super.key, required this.data});

  ItemModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 65,
          clipBehavior: Clip.hardEdge,
          decoration: myDecoration,
          child: Image.network(data.imgUrl, fit: BoxFit.cover,),
        ),
        const SizedBox(width: 10,),
        Expanded(child: Text(data.title, style: styleBody.copyWith(fontSize: 14), maxLines: 2,)),
      ],
    );
  }

  var myDecoration = const BoxDecoration(
      borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
  );
}
