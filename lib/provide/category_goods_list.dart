import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category_goodslist.dart';
import '../model/category.dart';

//商品分类列表
class CategoryGoodsListProvide with ChangeNotifier{
  List<CategoryListData> goodsList = [];

  getGoodsList(List<CategoryListData> list){
    goodsList = list;
    notifyListeners();
  }


   getMoreGoodsList(List<CategoryListData> list){
    goodsList.addAll(list);
    notifyListeners();
  }
}