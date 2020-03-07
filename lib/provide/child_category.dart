import 'package:flutter/material.dart';
import '../model/category.dart';
// 状态管理
class ChildCategory with ChangeNotifier{
  List<BxMallSubDto> childCategoryList = [];
  getChildCatgory(List list){
    childCategoryList = list;
    notifyListeners();
  }
}