
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/data_source.dart';

class TabViewWidget extends StatelessWidget {
  TabViewWidget({super.key, required this.isShowTabView});

  bool isShowTabView;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isShowTabView ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconTabView(appbarBodyData[0].img, isShowTabView),
            const SizedBox(width: 35,),
            iconTabView(appbarBodyData[1].img, isShowTabView),
            const SizedBox(width: 35,),
            iconTabView(appbarBodyData[5].img, isShowTabView),
            const SizedBox(width: 35,),
            iconTabView(appbarBodyData[4].img, isShowTabView),
          ],
        ),
      ),
    );
  }

  Widget iconTabView(String src, bool isSize){
    return AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: SizedBox(
          width: isSize ? 30 : 50,
          child: Image.asset(src),
        )
    );
  }
}
