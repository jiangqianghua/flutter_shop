import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import './provide/child_category.dart';
import 'package:provider/provider.dart';
void main() {
  // 状态管理
  var childCategory = ChildCategory();
      runApp(
        MultiProvider(
          providers: [
            // Provider.value(value: childCategory),
            ChangeNotifierProvider.value(value: childCategory)
          ],
          child: MyApp(),
        ),
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '小江的商铺',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink
      ),
      home: IndexPage(),
    );
  }
}
