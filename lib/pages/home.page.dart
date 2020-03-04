import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../component/home_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商店')
      ),
      body: FutureBuilder(  // 优化渲染
        future: getHomePageContent(),
        builder: (context, snapshot){
          print('init data:' + snapshot.data.toString());
          if (snapshot.hasData){
            print('gas data');
              var data = json.decode(snapshot.data.toString());
              List<Map> swiper = (data['data']['slides'] as List).cast();
              return Column(
                children: <Widget>[
                  HomeSwiper(swiperDataList: swiper,)
                ],
              );
          } else {
              return Center(
                child: Text('加载错误'),
              );
          }
        },
      )
    );
  }
}
