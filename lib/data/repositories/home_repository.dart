import 'package:bama_fruit/app/models/home/home_entity.dart';
import 'package:bama_fruit/data/api/http_client.dart';
import 'package:bama_fruit/data/sources/home_data_source.dart';

final homeRepository = HomeRepository(HomeRemoteDataSource(httpClient));

abstract class IHomeRepository{
  Future<HomeEntity> getHomeFeature();
}

class HomeRepository implements IHomeRepository{
  final IHomeDataSource dataSource;

  HomeRepository(this.dataSource);
  
  @override
  Future<HomeEntity> getHomeFeature() => dataSource.getHomeFeature();
 
}