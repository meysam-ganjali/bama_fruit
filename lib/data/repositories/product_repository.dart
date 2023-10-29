import 'package:bama_fruit/app/models/product/product_entity.dart';
import 'package:bama_fruit/data/api/http_client.dart';
import 'package:bama_fruit/data/sources/product_data_source.dart';
final productRepository = ProductRepository(ProductRemoteDataSource(httpClient));
abstract class IProductRepository{
Future<ProductEntity> productDetials({required int id});
}
class ProductRepository implements IProductRepository{
  final IProductDataSource datasource;

  ProductRepository(this.datasource);
  
  @override
  Future<ProductEntity> productDetials({required int id}) =>datasource.productDetials(id: id);
}