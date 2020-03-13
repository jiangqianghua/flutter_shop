import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
import 'package:provider/provider.dart';
import './provide/details_info.dart';
import 'package:fluro/fluro.dart';
import './routers/routers.dart';
import 'package:flutter_shop/routers/application.dart';
import './provide/cart.dart';

void main() {
  // 状态管理
  var childCategory = ChildCategory();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var detailsInfoProvide = DetailsInfoProvide();
  var cartProvide = CartProvide();
      runApp(
        MultiProvider(
          providers: [
            // Provider.value(value: childCategory),
            ChangeNotifierProvider.value(value: detailsInfoProvide),
            ChangeNotifierProvider.value(value: childCategory),
             ChangeNotifierProvider.value(value: categoryGoodsListProvide),
             ChangeNotifierProvider.value(value: cartProvide)
          ],
          child: MyApp(),
        ),
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Application.initShared();
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router; //对象静态化,全局都可以使用
    return MaterialApp(
      onGenerateRoute: Application.router.generator, // 绑定flutter路由
      title: '小江的商铺',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink
      ),
      home: IndexPage(),
    );
  }
}
