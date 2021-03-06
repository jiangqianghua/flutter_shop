import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // google风格
import 'home.page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import 'category_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int currentIndex = 0 ;
  var currentPage;
  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.search),
      title: Text('分类')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心')
    ),
  ];

  @override
  void initState() {
    currentPage = tabBodies[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 255, 255, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: IndexedStack(   //IndexedStack 可以保持页面不刷新
        index: currentIndex,
        children: tabBodies,
      ),
    );
  }
}