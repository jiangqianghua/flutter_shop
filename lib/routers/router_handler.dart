import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';
// 页面跳转 跳转到详情页面
Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String goodsId = params['id'].first;
    print('index -> detail googsId is ${goodsId}');
    return DetailsPage(goodsId);
  }
);