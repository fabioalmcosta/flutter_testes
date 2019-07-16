import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/repository/countrys/model/Category.dart';

class CountryCategory {
  final String img;
  final String name;
  final String shortDescription;
  final String description1;
  final String description2;
  final List<Category> category;

  CountryCategory(this.img, this.name, this.shortDescription, this.description1, this.description2, this.category);


  factory CountryCategory.fromJson(dynamic json) {
    return CountryCategory(
        json['flag_image'], json['name'], json['short_description'], json['description1'], json['description2'], json['category'].map<Category>((category) => new Category.fromMap(category))
    .toList());
  }

}
