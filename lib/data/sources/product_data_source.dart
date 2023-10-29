import 'package:bama_fruit/app/models/product/product_entity.dart';
import 'package:bama_fruit/data/api/validator_response.dart';
import 'package:dio/dio.dart';

abstract class IProductDataSource {
  Future<ProductEntity> productDetials({required int id});
}

class ProductRemoteDataSource
    with HttpResponseValidator
    implements IProductDataSource {
  final Dio httpClient;

  ProductRemoteDataSource(this.httpClient);
  @override
  Future<ProductEntity> productDetials({required int id}) async {
    var response = await httpClient.get("product/product_detial/$id");
    validateResponse(response);
    ProductEntity product = ProductEntity.fromJson(response.data);
    return product;
  }
}
