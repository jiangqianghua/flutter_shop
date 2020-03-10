import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/routers/application.dart';

class RecommendShop extends StatelessWidget {
  final recommendList ;
  RecommendShop({this.recommendList});

  // 标题
  Widget _titleWidget(){
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.black12)
          )
        ),
        child: Text(
          '商品推荐',
          style: TextStyle(color: Colors.pink)
        )
    );
  }

  // 商品单独项
   Widget _item(BuildContext context, index){
     return InkWell(
       onTap: (){
         Application.router.navigateTo(context, '/detail?id=${recommendList[index]['goodsId']}');
       },
       child: Container(
         height: ScreenUtil().setHeight(330),
         width: ScreenUtil().setWidth(250),
         decoration: BoxDecoration(
           color: Colors.white,
           border: Border(
             left: BorderSide(width: 0.5, color: Colors.black12)
           )
         ),
         child: Column(
           children: <Widget>[
             Image.network(recommendList[index]['image']),
             Text('¥${recommendList[index]['mallPrice']}'),
             Text(
               '¥${recommendList[index]['price']}',
               style: TextStyle(
                 decoration: TextDecoration.lineThrough , // 删除线
                 color: Colors.grey
               ),
               ),
           ],
         ),
       ),
     );
   }

   // 横向列表
   Widget _recommedList(BuildContext context){
     return Container(
       height: ScreenUtil().setHeight(330),
       child: ListView.builder(
         itemBuilder: (context, index){
         return _item(context, index);
       },
       scrollDirection: Axis.horizontal,
       itemCount: recommendList.length,
       ),
       
     );
   }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(390),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
        _recommedList(context)
        ],
      ),
    );
  }
}