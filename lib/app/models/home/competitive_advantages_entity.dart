
import 'package:bama_fruit/data/api/api_urls.dart';

class CompetitiveAdvantagesEntity {
  final int? id;
  final bool is_active;
  final String? title;
  final String? image;
  CompetitiveAdvantagesEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        is_active = json['is_active'],
        title = json['title'],
        image = ApiUrls.imageBaseUrl + json['image'];
}
