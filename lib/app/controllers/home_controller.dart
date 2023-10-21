

import 'package:bama_fruit/app/models/home/home_entity.dart';
import 'package:bama_fruit/data/repositories/home_repository.dart';

mixin HomeController {
  
  static Future<HomeEntity> getFeatures()async {
    var res = await homeRepository.getHomeFeature();
    return res;
  }
  
}
