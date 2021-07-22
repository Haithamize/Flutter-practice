import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {

  //https://newsapi.org/v2/top-headlines?country=us&apiKey=f26f38211b234181a30a8ac2430e7679  // this is the news api

  //'https://student.valuxapps.com/api/' da el api bta3 el shop app w 3shan m3ah headers fa lazm a7otha h7ot el headers el sabta 3ndi fl init

  //https://bridge-dev.zumrafood.com/
  static Dio dio;

  static init(){ //5alet de static 3shan anadiha fl main awl ma el app yft7 3shan a3ml object ml dio bta3i
    dio = Dio(BaseOptions(
      baseUrl: 'https://bridge-dev.zumrafood.com/',
      receiveDataWhenStatusError: true,
      method: 'POST',
      headers: <String, dynamic>{},
    ));
  }


  //de el method el 5asa bl get data bta3t el news
  //w de brdo static 3shan a3mlha access mn ay hetta fl code w hb3tlha el method eli 3yzha eli hya btb2a 3la shkl link w hwa byb2a tani goz2 fl api b3d el slash w da eli hy7rkni w ywdeni le table mo3ayan gwa el database fl server
  static Future<Response> getData(String path, {
    dynamic query,
    String token,
    String lang = 'en',
  }
  ) async{ //el query hna el mfrod enha Map<String,dynamic> fa lw 3ayz a3mlha msh dynamic lazm a5liha b nfs el se8a w mktpsh Map bs 3shan hydrb error
    dio.options.headers = {
    'lang': lang,
    'content-type': 'application/json;charset=UTF-8',
    'authorization': 'Bearer $token', //sa3at ha7tag el token m3aya zy lw hgip el profile bta3 el user wl manzar eli ana 3mlo da m3nah en lw fe kema 7otaha w lw mfish 7otlha null kda ''
    };

    return await dio.get(path, queryParameters: query??null, );
  }

  static Future<Response> post({
  @required String path,
    dynamic query,
    @required Map<String,dynamic> data, //tb3n lazm ab3t data 3shan b3ml login wl data de htb2a f shakl map key and value of the email and password
    String token,
    String lang = 'ar',
  }) async{
    dio.options.headers = {
      'lang': lang,
    'content-type': 'application/json;charset=UTF-8',
      'authorization': 'Bearer $token', //sa3at ha7tag el token m3aya zy lw hgip el profile bta3 el user
    };
    // dio.options.method = 'POST';

    return await dio.post(path,
    queryParameters: query??null,
    data: data,
    );
  }


  static Future<Response> put({
    @required String path,
    dynamic query,
    @required Map<String,dynamic> data, //tb3n lazm ab3t data 3shan b3ml login wl data de htb2a f shakl map key and value of the email and password
    String token,
    String lang = 'ar',
  }) async{
    dio.options.headers = {
      'lang': lang,
      'content-type': 'application/json;charset=UTF-8',
      'authorization': 'Bearer $token', //sa3at ha7tag el token m3aya zy lw hgip el profile bta3 el user
    };

    return await dio.put(path,
      queryParameters: query??null,
      data: data,
    );
  }


  static Future<Response> search({
    @required String path,
    dynamic query,
    String token,
    String lang = 'ar',
  }) async{
    dio.options.headers = {
      'lang': lang,
      'content-type': 'application/json;charset=UTF-8',
      'authorization': 'Bearer $token', //sa3at ha7tag el token m3aya zy lw hgip el profile bta3 el user
    };
    // dio.options.method = 'POST';

    return await dio.post(path,
      queryParameters: query??null,
    );
  }
}