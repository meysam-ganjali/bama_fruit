

import 'package:bama_fruit/app/models/home/background_advantages_entity.dart';
import 'package:bama_fruit/app/models/home/category_entity.dart';
import 'package:bama_fruit/app/models/home/center_slider_entity.dart';
import 'package:bama_fruit/app/models/home/competitive_advantages_entity.dart';
import 'package:bama_fruit/app/models/home/main_slider_entity.dart';
import 'package:bama_fruit/app/models/product/product_entity.dart';

class HomeEntity {
  late List<CompetitiveAdvantagesEntity> competitive_advantages;
  late BackgroundAdvantagesEntity background_advantages;
  late List<MainSliderEntity> mainslider;
  late List<CenterSliderEntity> centerslider;
  late List<ProductEntity> best_selling_slider;
  late List<ProductEntity> daily_offer;
  late List<CategoryEntity> categories;
   HomeEntity();
}
