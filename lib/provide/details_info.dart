import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null; 
  getGoodsInfo({String goodsId}){
    var formData = {'goodsId': goodsId};
    getGoodsDetailById().then((val){
        var responseData = json.decode(val.toString());
        print(responseData);
        goodsInfo = DetailsModel.fromJson(responseData);
        notifyListeners();
    });
  }
}