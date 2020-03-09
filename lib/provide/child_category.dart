import 'package:flutter/material.dart';
import '../model/category.dart';
// 状态管理
class ChildCategory with ChangeNotifier{
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0; // 子类高亮
  String categorId = '';
  String  subId = ''; // 子类id
  int page = 1; // 列表页
  String noMoreText = '' ;// 显示没有数据的文字
  // 大类切换逻辑
  getChildCatgory(List<BxMallSubDto> list, String id){
    page = 1;
    noMoreText = '';
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
    page = 1;
    noMoreText = '';
    notifyListeners();
  }

  addPage(){
    page++;
  }

  changeNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }

}