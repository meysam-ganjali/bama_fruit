import 'package:bama_fruit/app/models/user/user_entity.dart';
import 'package:bama_fruit/data/api/validator_response.dart';
import 'package:dio/dio.dart';

abstract class ICartDataSource {
  Future<String> addItem(int productId, String type);
  Future<List<UserCartEntity>> getCart();
}

class CartRemoteDataSource
    with HttpResponseValidator
    implements ICartDataSource {
  Dio httpClient;
  CartRemoteDataSource(this.httpClient);
  
  @override
  Future<String> addItem(int productId, String type) async{
    var response = await httpClient.post("users/user_cart/",data: {
      "product_id":productId,
      "type":"add_cart"
    });
    validateResponse(response);
    return response.data.toString();
  }
  
  @override
  Future<List<UserCartEntity>> getCart() async{
   var response = await httpClient.get("users/get_information_user/");
   validateResponse(response);
   final carts = <UserCartEntity>[];
   if(response.data['user_cart'] == null ){
    return carts;
   }
   for (var element in (response.data['user_cart'] as List)) {
    carts.add(UserCartEntity.fromJson(element));
   }
   return carts;
  }
}
