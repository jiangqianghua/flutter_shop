import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdBanner extends StatelessWidget {

  final String adPicture ;
  AdBanner({Key key, this.adPicture }):super(key:key);
  @override
  Widget build(BuildContext context) {
    print('adPicture $adPicture');
    return Container(
       color: Colors.red,
      child: Image.network(adPicture),
    );
  }
}