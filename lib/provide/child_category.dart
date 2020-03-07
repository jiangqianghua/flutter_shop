import 'package:flutter/material.dart';
import '../model/category.dart';
// 状态管理
class ChildCategory with ChangeNotifier{
  List<BxMallSubDto> childCategoryList = [];
  getChildCatgory(List<BxMallSubDto> list){
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '00';
    all.mallCategoryId = '00';
    all.comments = '';
    all.mallSubName = '全部';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }
}