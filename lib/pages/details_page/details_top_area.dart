import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var detailModel = Provider.of<DetailsInfoProvide>(context,listen: false).goodsInfo;
    if (detailModel == null){
      print('DetailsTopArea waiting');
      return Container(
        child: Center(
          child: Text("正在加载..."),
        ),
      );
    }
    var detailsGoodsData = detailModel.data;
    return Container(
      child: Column(children: <Widget>[
        _goodsImage(detailsGoodsData.goodInfo.image1),
        _goodsName(detailsGoodsData.goodInfo.goodsName),
        _goodsNum(detailsGoodsData.goodInfo.goodsSerialNumber),
        _goodsPrice(detailsGoodsData.goodInfo.oriPrice, detailsGoodsData.goodInfo.presentPrice)
      ],
      ),
    );
  }

  /// 商品图片
  Widget _goodsImage(url){
    return Image.network(
      url,
      width:ScreenUtil().setWidth(740)
    );
  }

  Widget _goodsName(name){
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left:15.0),
      child: Text(
        name,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30)
        ),
      ),
    );
  }

  // 商品编号
  Widget _goodsNum(num){
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left:15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        '编号, ${num}',
        style: TextStyle(color: Colors.black12),
      ),
    );
  }

  Widget _goodsPrice(oriPrice, presentPrice) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left:15),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Text(
            '￥${oriPrice}',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(26),
              color: Colors.pink
            ),
          ),
          Text(
            '市场价:',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(24),
              color: Colors.black54,
            ),
          ),
          Text(
            '￥${presentPrice}',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              color: Colors.black26,
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
      
    );
  }
}