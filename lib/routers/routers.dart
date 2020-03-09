import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';
/// 总的路由配置
class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        print('ERROR -> route was not found!!!'); /// 找不到路由情况
      }
    );
    router.define(detailsPage, handler: detailsHandler);
  }
}