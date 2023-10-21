

import 'package:bama_fruit/data/api/api_urls.dart';

class CategoryEntity {
  final int id;
  final bool is_active;
  final bool is_delete;
  final String title;
  final String? slug_text;
  final String? slug;
  final String? image;
  final String? list_slug;
  final int? parent_category;

  CategoryEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        is_active = json['is_active'],
        is_delete = json['is_deleted'],
        title = json['title'],
        slug_text = json['slug_text'],
        slug = json['slug'],
        image = ApiUrls.imageBaseUrl + json['image'],
        list_slug = json['list_slug'],
        parent_category = json['parent_category'];
}
