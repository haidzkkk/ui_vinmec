
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myvinmec/screen/home/widget/appbar_detail_widget.dart';
import 'package:myvinmec/screen/home/widget/item_service.dart';
import 'package:myvinmec/screen/home/widget/padding_widget.dart';
import 'package:myvinmec/screen/home/widget/tabview_widget.dart';
import 'package:myvinmec/screen/splass/widget/circle_widget.dart';
import 'package:myvinmec/screen/splass/widget/item_info.dart';
import 'package:myvinmec/screen/splass/widget/item_question.dart';
import 'package:myvinmec/utils/drag_widget.dart';
import 'package:myvinmec/utils/style.dart';

import '../../utils/color.dart';
import '../../utils/data_source.dart';
import '../splass/widget/item_new.dart';
import '../splass/widget/item_notify.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final ScrollController controller = ScrollController();
  bool isShowTabView = false;
  double width = 0;
  double height = 0;

  static HomeScreenState of(BuildContext context) {
    final state = context.findAncestorStateOfType<HomeScreenState>();
    if (state != null) {
      return state;
    } else {
      throw Exception('Please provide ShowCaseView context');
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {

      // giảm tải
      if((controller.offset > 450 && isShowTabView == false)
          || (controller.offset < 450 && isShowTabView == true)){
        isShowTabView = controller.offset > 450;
        setState(() {});
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarDetailWidget(),
                  const SizedBox(height: 20,),
                  PaddingHomeWidget(child: Text("Dịch vụ mới", style: styleTitleBold,)),
                  const SizedBox(height: 5,),
                  PaddingHomeWidget(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: newServiceData.length,
                      itemBuilder: (context, index){
                        return ItemService(data: newServiceData[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 10,),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  PaddingHomeWidget(child: Text("Câu hỏi sàng lọc sức khỏe", style: styleTitleBold,)),
                  const SizedBox(height: 5,),
                  PaddingHomeWidget(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: questionData.length,
                      itemBuilder: (context, index){
                        return ItemQuestion(data: questionData[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 10,),
                    ),
                  ),

                  const SizedBox(height: 20,),
                  PaddingHomeWidget(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Thông báo quan trọng", style: styleTitleBold,),
                        CircleWidget(
                          color: Colors.grey.withOpacity(0.7),
                          size: 25,
                          child: const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 20,),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: notifyData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        EdgeInsets padding;
                        if(index == 0) {
                          padding = const EdgeInsets.only(left: 20);
                        } else if(index == notifyData.length - 1) {
                          padding = const EdgeInsets.only(right: 20);
                        }else{
                          padding = const EdgeInsets.only();
                        }

                        return Padding(
                            padding: padding,
                            child: ItemNotify(title: notifyData[index])
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(width: 10,),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: itemInfoData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        EdgeInsets padding;
                        if(index == 0) {
                          padding = const EdgeInsets.only(left: 20);
                        } else if(index == itemInfoData.length - 1) {
                          padding = const EdgeInsets.only(right: 20);
                        }else{
                          padding = const EdgeInsets.only();
                        }

                        return Padding(
                            padding: padding,
                            child: ItemInfo(data: itemInfoData[index])
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(width: 10,),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  PaddingHomeWidget(child: Text("Tin mới nhất", style: styleTitleBold,)),
                  const SizedBox(height: 5,),
                  PaddingHomeWidget(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: newData.length,
                      itemBuilder: (context, index){
                        return ItemNew(data: newData[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 15,),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Center(child: Text("Xem thêm", style: styleBody.copyWith(color: primaryColor, fontSize: 12),)),

                  const SizedBox(height: 10,),
                  Image.network("https://i.rada.vn/data/image/2022/10/02/MyVinmec-700.jpg", height: 200, fit: BoxFit.cover,)
                ],
              ),
            ),
            TabViewWidget(isShowTabView: isShowTabView)
          ],
        )
      ),
      floatingActionButton: DragWidget(
        child: GestureDetector(
          onTap: (){},
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadiusDirectional.all(Radius.circular(100)),
                boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)]
            ),
            child: Image.asset("${assetsSource}chat.png", width: 30,)
          ),
        ),
      )
    );
  }
}
