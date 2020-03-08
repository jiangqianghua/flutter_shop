import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model/category.dart';
import '../provide/child_category.dart';
import '../provide/category_goods_list.dart';
import 'package:provider/provider.dart';
import '../model/category_goodslist.dart';

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
              RightCategoryNav(),
              CategoryGoodsList()
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
    // print('left click $index');
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // 监听状态改变
    final childCategory = Provider.of<ChildCategory>(context);
    if (childCategory.childCategoryList != null && childCategory.childCategoryList.length > 0)
      _getGoodsList(categoryId: childCategory.childCategoryList[0].mallCategoryId);
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
        _getGoodsList(categoryId: item.mallCategoryId);
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

  void _getGoodsList({String categoryId}) {
    var data = {
      'categoryId':categoryId == null ? '4':categoryId,
      'page':1
    };
    getCategoryMallList().then((val){
        var data = json.decode(val.toString());
        CategoryGoodsListModel goodsListModel = CategoryGoodsListModel.fromJson(data);
        print('>>>>>>>>>>> ${goodsListModel.data.length}');
        // 通知状态管理
        Provider.of<CategoryGoodsListProvide>(context,listen: false).getGoodsList(goodsListModel.data);
        
    });
    }
}
// 商品列表，上拉加载
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final List<CategoryListData> list = Provider.of<CategoryGoodsListProvide>(context).goodsList;
    print('_CategoryGoodsListState: ${list.length}');
    return Container(
        width: ScreenUtil().setWidth(570),
        height: ScreenUtil().setHeight(900),
        child: ListView.builder(itemBuilder: (context, index){
          return _listWidget(list, index);
        },
        itemCount: list.length,),
    );
  }

  // void _getGoodsList() {
  //   getCategoryMallList().then((val){
  //       var data = json.decode(val.toString());
  //       CategoryGoodsListModel goodsListModel = CategoryGoodsListModel.fromJson(data);
  //       // print('>>>>>>>>>>> ${goodsListModel.data}');
  //       setState(() {
  //         list = goodsListModel.data;
  //       });
  //   });
  // }

  Widget _goodsImage(List<CategoryListData> list, index){
      return Container(
        width: ScreenUtil().setWidth(200),
        child: Image.network(list[index].image),
      );
  }

  Widget _goodsName(List<CategoryListData> list,index){
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
          list[index].goodsName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(List<CategoryListData> list,index){
    return Container(
            width: ScreenUtil().setWidth(370),
            margin: EdgeInsets.only(top: 30),
      child: Row(
        children: <Widget>[
          Text(
            '价格： ￥${list[index].presentPrice}',
            style: TextStyle(color:Colors.pink, fontSize: ScreenUtil().setSp(30)),
            ),
          Text(
            '￥${list[index].oriPrice}',
            style: TextStyle(color: Colors.black26, decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }
  Widget _listWidget(List<CategoryListData> list,int index){
    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.only(top:5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.black12)
            )
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(list,index),
            Column(children: <Widget>[
              _goodsName(list,index),
              _goodsPrice(list,index)
            ],)
          ],
        ),
      ),
    );
  }
}

