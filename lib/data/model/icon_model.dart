
import 'package:flutter/cupertino.dart';

class IconModel{
  IconModel({
    required this.name,
    required this.img,
    this.isSelect,
});

  String name;
  String img;
  bool? isSelect;
}