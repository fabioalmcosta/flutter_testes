import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final String backgroundImage;
  final String description;

  Category(this.id, this.name, this.backgroundImage, this.description);

  Category.fromMap(Map<String, dynamic> map)
      : id = map['idcountry'],
        name = map['name'],
        backgroundImage = map['background_image'],
        description = map['description'];
}
