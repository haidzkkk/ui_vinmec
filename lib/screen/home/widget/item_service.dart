
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myvinmec/data/model/item_model.dart';
import 'package:myvinmec/utils/color.dart';
import 'package:myvinmec/utils/style.dart';

class ItemService extends StatelessWidget {
  ItemService({super.key, required this.data});

  ItemModel data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: myDecoration,
          child: Row(
            children: [
              Image.network(data.imgUrl, width: 50, height: 50, fit: BoxFit.cover,),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.title, style: styleBodyBold.copyWith(fontSize: 14), maxLines: 2,),
                    Text("${data.desc}", style: styleBodyNote.copyWith(color: Colors.grey), maxLines: 2,),
                  ],
                ),
              ),
              const SizedBox(width: 10,),
              const Icon(Icons.keyboard_arrow_right, color: Colors.red,),
            ],
          ),
        ),
        Container(
          width: 5,
          height: 40,
          color: primaryColor,
        )
      ],
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
