import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {

  bool isLeft = true;
  bool isRight = false;
  DetailsModel goodsInfo = null; 
  getGoodsInfo({String goodsId}) async{
    var formData = {'goodsId': goodsId};
    await getGoodsDetailById().then((val){
        var responseData = json.decode(val.toString());
        print(responseData);
        goodsInfo = DetailsModel.fromJson(responseData);
        notifyListeners();
    });
  }

  // tabbar切换
  changeLeftandRight(String changeState){
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}