import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provide/cart.dart';
import './cart_page/cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车')
      ),
      body:FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot){
          if (snapshot.hasData){
            List cartList = _getCartProvide(context).cartList;
            return ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index){
                return CartItem(cartList[index]);
              }
              );
          } else {
            return Center(
              child: Text('正在加载'),
            );
          }
        },
      )
    );
  }

  Future<String> _getCartInfo(BuildContext context) async{
    await _getCartProvide(context).getCartInfo();
    return "end";
  }

  CartProvide _getCartProvide(BuildContext context){
    return Provider.of<CartProvide>(context);
  }
}