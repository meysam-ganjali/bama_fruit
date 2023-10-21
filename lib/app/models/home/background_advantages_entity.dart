

import 'package:bama_fruit/data/api/api_urls.dart';

class BackgroundAdvantagesEntity {
  final bool is_active;
  final String title;
  final String image;

  BackgroundAdvantagesEntity.fromJson(Map<String, dynamic> json)
      : is_active = json['is_actove'],
        title = json['title'],
        image = ApiUrls.imageBaseUrl + json['image'];
}
