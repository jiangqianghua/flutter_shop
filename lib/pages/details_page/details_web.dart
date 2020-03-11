import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsDetails = Provider.of<DetailsInfoProvide>(context).goodsInfo.data.goodInfo.goodsDetail;
    return Container(
      child: Html(
        data: goodsDetails,
      ),
    );
  }
}