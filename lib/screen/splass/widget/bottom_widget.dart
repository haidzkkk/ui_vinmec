
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myvinmec/screen/splass/widget/item_language.dart';
import 'package:myvinmec/utils/data_source.dart';
import 'package:myvinmec/utils/style.dart';

import '../../../utils/color.dart';
import '../../home/home_screen.dart';
import '../../navigate_screen.dart';

class BottomWidget extends StatefulWidget{
  BottomWidget({super.key});

  @override
  State<StatefulWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  String languageSelect = languageData[0].name;

  double rateMaxHeight = 0.4;
  double rateMinHeight = 0;
  double height = 0;
  double width = 0;

  bool _notificationDraggebleScoller(DraggableScrollableNotification draggableScrollableNotification){
    print("${draggableScrollableNotification.extent}");
    if(draggableScrollableNotification.extent == rateMinHeight){
      SystemNavigator.pop();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return NotificationListener<DraggableScrollableNotification>(
      onNotification: _notificationDraggebleScoller,
      child: DraggableScrollableSheet(
        initialChildSize: rateMaxHeight,
        minChildSize: rateMinHeight,
        maxChildSize: rateMaxHeight,
        snapSizes: [rateMinHeight, rateMaxHeight],
        snap: true,
        builder: (context, scrollController){
          scrollController.addListener(() {});
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                  height: height * 0.01,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(100))
                  ),
                  margin: EdgeInsets.all(height * 0.02),
                ),
                Container(
                  decoration: const BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                  ),
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: height * 0.35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15,),
                      Text("Chọn ngôn ngữ", style: styleTitleBold.copyWith(fontSize: width * 0.07) ,),
                      const SizedBox(height: 10,),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: languageData.length,
                        itemBuilder: (context, indext){
                          return ItemLanguage(
                            data: languageData[indext],
                            isSelect: languageData[indext].name == languageSelect,
                            onTap: (value) {
                              setState(() {
                                languageSelect = value;
                              });
                             },
                            );
                        }
                      ),
                      const SizedBox(height: 5,),
                      TextButton(
                        style: styleButton,
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigateScreen()));
                        },
                        child: Text("Xác nhận", style: styleBodyBold.copyWith(color: Colors.white),),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
        ),
    );
  }

  var styleButton = TextButton.styleFrom(
    minimumSize: const Size(double.infinity, 45),
    backgroundColor: primaryColor,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(Radius.circular(10))
    ),
  );
}