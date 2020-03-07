import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model/category.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Row(
        children: <Widget>[
          LeftCagetoryNav()
        ],
      ),
    );
  }
}
// 左侧大类导航
class LeftCagetoryNav extends StatefulWidget {
  @override
  _LeftCagetoryNavState createState() => _LeftCagetoryNavState();
}

class _LeftCagetoryNavState extends State<LeftCagetoryNav> {
  List<CategoryBigModel> list = [];
  @override
  void initState(){
    _getCategory();
    super.initState();
  }
  Widget _leftInkWellItem(int index){
    return InkWell(
      onTap: (){

      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left:10, top:16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color:Colors.black12)
          )
        ),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28)
          ),
        ),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: ListView.builder(itemBuilder: (context, index){
        return _leftInkWellItem(index);
      },itemCount: list.length,
      ),
    );
  }

    void _getCategory() async {
    await getCategory().then((val){
      var data = json.decode(val.toString());
      CategoryBigListModel categoryBigListModel = CategoryBigListModel.fromJson(data['data']);
      setState(() {
        list = categoryBigListModel.data;
      });
      // list = list.data.forEach((item)=>print(item.mallCategoryName));
    });
  }
}

