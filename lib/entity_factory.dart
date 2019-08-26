import 'package:gank_flutter/model/category_entity.dart';
import 'package:gank_flutter/model/mei_zi_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "CategoryEntity") {
      return CategoryEntity.fromJson(json) as T;
    } else if (T.toString() == "MeiZiEntity") {
      return MeiZiEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}