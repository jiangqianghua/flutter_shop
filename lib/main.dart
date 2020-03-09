import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import './routers/routers.dart';
import 'package:flutter_shop/routers/application.dart';

void main() {
  // 状态管理
  var childCategory = ChildCategory();
  var categoryGoodsListProvide = CategoryGoodsListProvide();

      runApp(
        MultiProvider(
          providers: [
            // Provider.value(value: childCategory),
            ChangeNotifierProvider.value(value: childCategory),
             ChangeNotifierProvider.value(value: categoryGoodsListProvide)
          ],
          child: MyApp(),
        ),
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
