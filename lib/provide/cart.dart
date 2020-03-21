import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_shop/routers/application.dart';
import '../model/cartinfo.dart';

class CartProvide with ChangeNotifier {
  String cartString = "[]";
  List<CartInfoModel> cartList = [];

  save(goodsId, goodsName, count, price, image) async{
    cartString = Application.prefs.getString('cartInfo');
    var temp = cartString == null?[]:json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    bool isHave = false;
    int ival = 0 ;
    tempList.forEach((item){
      if (item['goodsId'] == goodsId) {
        tempList[ival]['count'] = item['count'] + 1;
        cartList[ival].count++;
        isHave = true;
      }
      ival++;
    });

    if (!isHave) {
      Map<String, dynamic> newGoods = {
         'goodsId':goodsId,
        'goodsName':goodsName,
        'count':count,
        'price':price,
        'image': image,
        'isCheck': true
      };
      // 添加
      tempList.add(newGoods);
      cartList.add(CartInfoModel.fromJson(newGoods));
    }

    cartString = json.encode(tempList).toString();
    print(cartString);
    Application.prefs.setString("cartInfo", cartString);
    notifyListeners();
  }

  remove() async {
    Application.prefs.remove('cartInfo');
    print('清空购物车');
    cartList = [];
    notifyListeners();
  }

  getCartInfo() async {
    cartString = Application.prefs.getString('cartInfo');
    cartList = [];
    if (cartString == null){
      cartList = [];
    } else {
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      tempList.forEach((item){
        cartList.add(CartInfoModel.fromJson(item));
      });
    }
  }

  //删除一个商品
  deleteOneGoods(String goodsIf) async{

  }
}