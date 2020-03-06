import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';
const ContentTypeFrom = 'application/x-www';
const ContentTypeJson = 'application/json';
Future getHomePageContent() async{
  try{
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse(ContentTypeJson);
    dio.options.responseType = ResponseType.plain;
    var fromData = {'lon': '115.02932', 'lat': '35.76189'};
    // response = await dio.post(servicePath['homePageContent'], data:fromData);
    response = await dio.get(servicePath['homePageContent']);
    if (response.statusCode == 200){
      return response.data;
    } else {
      throw Exception('获取数据异常');
    }
  }catch(e){
    return print('ERROR: ======== ${e}');
  }

}


Future getHomePageBelowConten() async{
  try{
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse(ContentTypeJson);
    dio.options.responseType = ResponseType.plain;
    var fromData = {'lon': '115.02932', 'lat': '35.76189'};
    // response = await dio.post(servicePath['homePageContent'], data:fromData);
    response = await dio.get(servicePath['homePageBelowConten']);
    if (response.statusCode == 200){
      return response.data;
    } else {
      throw Exception('获取数据异常');
    }
  }catch(e){
    return print('ERROR: ======== ${e}');
  }

}


Future getCategory() async{
  try{
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse(ContentTypeJson);
    dio.options.responseType = ResponseType.plain;
    response = await dio.get(servicePath['getCategory']);
    if (response.statusCode == 200){
      return response.data;
    } else {
      throw Exception('获取数据异常');
    }
  }catch(e){
    return print('ERROR: ======== ${e}');
  }

}


// Future requestGet(url) async{
//    try{
//     Response response;
//     Dio dio = new Dio();
//     dio.options.contentType = ContentType.parse(ContentTypeJson);
//     dio.options.responseType = ResponseType.plain;
//     response = await dio.get(servicePath[url]);
//     if (response.statusCode == 200){
//       return response.data;
//     } else {
//       throw Exception('获取数据异常');
//     }
//   }catch(e){
//     return print('ERROR: ======== ${e}');
//   }
// }