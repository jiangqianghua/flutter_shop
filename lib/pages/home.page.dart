import 'package:flutter/material.dart';
import 'package:flutter_shop/component/top_navigator.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../component/home_swiper.dart';
import '../component/top_navigator.dart';
import '../component/ad_banner.dart';
import '../component/leader_phone.dart';
import '../component/recommend_shop.dart';
import '../component/floor_shop.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  String homePageContent = '正在获取数据';

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('show home page');
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

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
              var dataInfo = data['data'];
              List<Map> swiper = (dataInfo['slides'] as List).cast();
              List<Map> navgatorList = (dataInfo['category'] as List).cast();
              String adPicture = dataInfo['advertesPicture']['PICTURE_ADDRESS'];
              String leaderImage = dataInfo['shopInfo']['leaderImage'];
              String leaderPhone = dataInfo['shopInfo']['leaderPhone'];
              List<Map> recommendList = (dataInfo['recommend'] as List).cast();
              String floor1Title = dataInfo['floor1Pic']['PICTURE_ADDRESS'];
              List<Map> floor1 = (dataInfo['floor1'] as List).cast();
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    HomeSwiper(swiperDataList: swiper,),
                    TopNavigator(navigatorList: navgatorList,),
                    AdBanner(adPicture: adPicture,),
                    LeaderPhone(leaderImage: leaderImage, leaderPhone: leaderPhone,),
                    RecommendShop(recommendList:recommendList),
                    FloorTitle(picture_address: floor1Title),
                    FloorContent(floorGoodsList:floor1)
                  ],
                )
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
