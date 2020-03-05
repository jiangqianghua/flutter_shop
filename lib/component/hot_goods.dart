import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HotGoods extends StatefulWidget {

  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  final List<Map> _hotGoodsList = List();
  int page = 0;
  void _getHotGoods(){
    getHomePageBelowConten().then((val){
        print('_getHotGoods-- $val');
        var data = json.decode(val.toString());
        print('_getHotGoods++ $data');
        List<Map> newGoodsList = (data['data'] as List).cast();
        setState(() {
          _hotGoodsList.addAll(newGoodsList);
          page++;
        });
    });
  }
  @override
  void initState() {
    super.initState();
    _getHotGoods();
  }

  Widget hotTitle = Container(
    margin: EdgeInsets.only(top:10.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    padding: EdgeInsets.all(5.0),
    child: Text('火爆专区'),
  );

  Widget _wrapList(){
    if (_hotGoodsList.length != 0){
      // 把map转成Widet放到流布局中
      List<Widget> listWidget = _hotGoodsList.map((item){
        return InkWell(
          onTap: (){

          },
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom:3.0),
            child: Column(
              children: <Widget>[
                Image.network(item['image'], width: ScreenUtil().setWidth(370),),
                Text(
                  item['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text('¥${item['mallPrice']}'),
                    Text(
                      '¥${item['price']}',
                      style: TextStyle(color:Colors.black26,
                      decoration: TextDecoration.lineThrough)
                    )
                  ]
                )
              ]
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2, //2列
        children: listWidget,
      );
    } else {
      return Text('无数据');
    }
  }

  Widget _hotGoods(){
    return Container(
        child: Column(
          children: <Widget> [
            hotTitle,
            _wrapList()
          ]
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return _hotGoods();
  }
}