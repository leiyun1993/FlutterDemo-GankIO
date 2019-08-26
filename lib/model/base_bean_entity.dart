import 'package:gank_flutter/entity_factory.dart';
/// 解析基类
class BaseBeanEntity<T> {
  bool error;
  Map<String, dynamic> results;
  List<dynamic> resultsList;

  BaseBeanEntity({this.error, this.results, this.resultsList});

  /// 处理results为对象的情况
  BaseBeanEntity.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    results = json['results'];
  }

  /// 处理results为数组的情况
  BaseBeanEntity.fromJsonList(Map<String, dynamic> json) {
    error = json['error'];
    resultsList = json['results'];
  }

  /// 获取results对象
  T getObject<T>() {
    return EntityFactory.generateOBJ<T>(results); //使用EntityFactory解析对象
  }

  /// 获取results数组
  List<T> getList<T>() {
    var list = new List<T>();
    if (resultsList != null) {
      resultsList.forEach((v) { //拼装List
        list.add(EntityFactory.generateOBJ<T>(v));//使用EntityFactory解析对象
      });
    }
    return list;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.results != null) {
      data['results'] = this.results;
    }
    return data;
  }
}
