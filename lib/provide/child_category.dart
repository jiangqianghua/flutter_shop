import 'package:flutter/material.dart';
import '../model/category.dart';
// 状态管理
class ChildCategory with ChangeNotifier{
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0; // 子类高亮
  String categorId = '';
  String  subId = ''; // 子类id
  // 大类切换逻辑
  getChildCatgory(List<BxMallSubDto> list, String id){
    childIndex = 0;
    categorId = id;
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '00';
    all.mallCategoryId = '00';
    all.comments = '';
    all.mallSubName = '全部';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }
  // 小类切换逻辑
  changeChildIndex(index, String id){
    childIndex = index;
    subId = id;
    notifyListeners();
  }

}