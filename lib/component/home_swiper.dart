import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// 首页轮播图
class HomeSwiper extends StatelessWidget {

  final List swiperDataList;

  HomeSwiper({this.swiperDataList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.network("${swiperDataList[index]['image']}", fit: BoxFit.fill,);
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),

    );
  }
}