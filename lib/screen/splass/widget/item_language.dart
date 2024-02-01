
import 'package:flutter/material.dart';
import 'package:myvinmec/data/model/language.dart';

import '../../../utils/color.dart';

class ItemLanguage extends StatelessWidget {

  ItemLanguage({
    required this.data,
    required this.isSelect,
    required this.onTap,
  });

  Language data;
  bool isSelect;
  Function(String) onTap;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap(data.name);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: isSelect ? primaryColor : Colors.white,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.all(Radius.circular(4))
                  ),
                  child: Image.asset(data.flagUrl, width: 30, height: 20,)
                  ),
                const SizedBox(width: 20,),
                Text(data.name)
              ],
            ),
            Icon(Icons.done, color: isSelect ? primaryColor : Colors.white,)
          ],
        ),
      ),
    );
  }

  
}