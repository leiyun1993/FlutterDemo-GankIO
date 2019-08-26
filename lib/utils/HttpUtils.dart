import 'package:dio/dio.dart';
import 'package:gank_flutter/utils/LogUtils.dart';

class HttpUtils {
  static const BASE_URL = "http://gank.io/api";
  static const CONNECT_TIMEOUT = 5000;
  static const RECEIVE_TIMEOUT = 3000;
  static Dio dio;

  /// 生成Dio实例
  static Dio getInstance() {
    if (dio == null) {
      //通过传递一个 `BaseOptions`来创建dio实例
      var options = BaseOptions(
          baseUrl: BASE_URL,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT);
      dio = new Dio(options);
    }
    return dio;
  }

  /// 请求api
  static Future<Map> request(String url, {data, method}) async {
    data = data ?? {};
    method = method ?? "get";

    // 由于我示例的接口是 http://gank.io/api/data/福利/10/1
    // 所以使用下面这张方式拼接get参数
    // 如上面则为 http://gank.io/api/data/:category/:pageSize/:page
    data.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    // 打印请求相关信息：请求地址、请求方式、请求参数
    LogUtils.log("请求地址：【$method $url】");
    LogUtils.log("请求参数：【$data】");

    var dio = getInstance();
    var res;
    if (method == "get") {
      // get
      var response = await dio.get(url);
      res = response.data;
    } else {
      // post
      var response = await dio.post(url, data: data);
      res = response.data;
    }
    return res;
  }

  /// get
  static Future<Map> get(url, data) => request(url, data: data);

  /// post
  static Future<Map> post(url, data) =>
      request(url, data: data, method: "post");
}
