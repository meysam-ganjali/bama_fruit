

import 'package:bama_fruit/data/api/api_urls.dart';

class ProductEntity {
  final String title;
  final bool is_active;
  final String? company;
  final int? discount;
  final int sale_price;
  final String? price_after_discount;
  final String? barcode;
  final String? short_description;
  final String? long_description;
  final String? image;
  final String product_unit;
  ProductEntity.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        is_active = json['is_active'],
        company = json['company'],
        discount = json['discount'],
        sale_price = json['sale_price'],
        price_after_discount = json['price_after_discount'],
        barcode = json['barcode'],
        short_description = json['short_description'],
        long_description = json['description'],
        image = ApiUrls.imageBaseUrl + json['image'],
        product_unit = json['product_unit'];
}
