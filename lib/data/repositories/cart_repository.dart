import 'package:bama_fruit/app/models/user/user_entity.dart';
import 'package:bama_fruit/data/api/http_client.dart';
import 'package:bama_fruit/data/sources/cart_data_sourse.dart';
final cartRepository = CartRepository(CartRemoteDataSource(httpClient));
abstract class ICartRepository{
 Future<String> addItem(int productId);
 Future<List<UserCartEntity>> getCart();
}
class CartRepository implements ICartRepository{
  final ICartDataSource datasource;

  CartRepository(this.datasource);
  
  @override
  Future<String> addItem(int productId) async{
   return  datasource.addItem(productId, "add_cart");
  }
  
  @override
  Future<List<UserCartEntity>> getCart() {
    return datasource.getCart();
  }

}