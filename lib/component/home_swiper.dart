import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/routers/application.dart';
// 首页轮播图
class HomeSwiper extends StatelessWidget {

  final List swiperDataList;

  HomeSwiper({this.swiperDataList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.network("${swiperDataList[index]['image']}", fit: BoxFit.fill,);
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
        onTap: (index){
          Application.router.navigateTo(context, '/detail?id=${swiperDataList[index]['goodsId']}');
        },
      ),

    );
  }
}