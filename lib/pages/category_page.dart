import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model/category.dart';
import '../provide/child_category.dart';
import 'package:provider/provider.dart';

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
          LeftCagetoryNav(),
          Column(
            children: <Widget>[
              RightCategoryNav()
            ],
          )
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
  List<Data> list = [];
  var listIndex = 0;
  @override
  void initState(){
    _getCategory();
    super.initState();
  }
  Widget _leftInkWellItem(int index){
    print('left click $index');
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;
    return InkWell(
      onTap: (){
        setState(() {
          listIndex = index;
        });
        var childList = list[index].bxMallSubDto;
        // 通知状态管理
        Provider.of<ChildCategory>(context,listen: false).getChildCatgory(childList);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left:10, top:16),
        decoration: BoxDecoration(
          color: isClick ? Colors.black12 :Colors.white,
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
      CategoryModel categoryBigListModel = CategoryModel.fromJson(data);
      setState(() {
        list = categoryBigListModel.data;
        Provider.of<ChildCategory>(context,listen: false).getChildCatgory(list[0].bxMallSubDto);
      });
      // list = list.data.forEach((item)=>print(item.mallCategoryName));
    });
  }
}

class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    // 监听状态改变
    final childCategory = Provider.of<ChildCategory>(context);

    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(570),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: childCategory.childCategoryList?.length,
        itemBuilder: (context, index){
          return _rightInkWell(childCategory.childCategoryList[index]);
        },
      ),
    );
  }

  Widget _rightInkWell(BxMallSubDto item){
    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.mallSubName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}

