import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provide/details_info.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    _getBackInfo(context);
    return Container(
      child: Center(
        child: Text('商品ID ${goodsId}'),
      ),
    );
  }

  void _getBackInfo(BuildContext context) async {
    await Provider.of<DetailsInfoProvide>(context,listen: false).getGoodsInfo(goodsId:goodsId);
  }
}