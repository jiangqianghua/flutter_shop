import 'package:flutter/material.dart';
import '../utils/base_utils.dart';

class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  LeaderPhone({this.leaderImage, this.leaderPhone});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          BaseUtils.callPhone(leaderPhone);
        },
        child: Image.network(leaderImage),
      ),
    );
  }
}