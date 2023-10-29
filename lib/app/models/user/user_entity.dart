import 'package:bama_fruit/data/api/api_urls.dart';

class UserEntity{
  final int id;
  final String userFullName;
  final String userName;
  UserEntity({required this.id, required this.userFullName, required this.userName});

}

class UserCartEntity{
  final int id;
  final String title;
  final int discount;
  final int salePrice;
  final String priceAfterDiscount;
  final String image;
  final String productUnit;

UserCartEntity.fromJson(Map<String,dynamic> json)
:id=json['id'],
title=json['title'],
discount=json['discount'],
salePrice=json['sale_price'],
priceAfterDiscount=json['price_after_discount'],
image=ApiUrls.imageBaseUrl + json['image'],
productUnit=json['product_unit'];
}