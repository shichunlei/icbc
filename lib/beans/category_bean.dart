import 'package:json_annotation/json_annotation.dart';

part 'category_bean.g.dart';

@JsonSerializable()
class CategoryBean {
  final List<Category> mine;
  final Category? common;
  final Category? recommend;
  final List<Category> category;

  const CategoryBean({this.mine = const [], this.common, this.recommend, this.category = const []});

  factory CategoryBean.fromJson(Map<String, dynamic> json) => _$CategoryBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryBeanToJson(this);
}

@JsonSerializable()
class Category {
  final String? title;
  final List<ItemsEntity> items;

  const Category({this.title, this.items = const []});

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class ItemsEntity {
  final String? id;
  final String? title;
  final String? imagePath;
  final String? routeName;

  const ItemsEntity({this.id, this.title, this.imagePath, this.routeName});

  factory ItemsEntity.fromJson(Map<String, dynamic> json) => _$ItemsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsEntityToJson(this);
}
