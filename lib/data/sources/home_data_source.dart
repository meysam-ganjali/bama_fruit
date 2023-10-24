import 'package:bama_fruit/app/models/home/background_advantages_entity.dart';
import 'package:bama_fruit/app/models/home/category_entity.dart';
import 'package:bama_fruit/app/models/home/center_slider_entity.dart';
import 'package:bama_fruit/app/models/home/competitive_advantages_entity.dart';
import 'package:bama_fruit/app/models/home/home_entity.dart';
import 'package:bama_fruit/app/models/home/main_slider_entity.dart';
import 'package:bama_fruit/app/models/home/product_entity.dart';
import 'package:bama_fruit/data/api/validator_response.dart';
import 'package:dio/dio.dart';

abstract class IHomeDataSource {
  Future<HomeEntity> getHomeFeature();
}

class HomeRemoteDataSource with HttpResponseValidator implements IHomeDataSource {
  final Dio httpClient;

  HomeRemoteDataSource(this.httpClient);

  @override
  Future<HomeEntity> getHomeFeature() async {
    final response = await httpClient.get("main/Home/");
    validateResponse(response);
    final competitiveAdvantages = <CompetitiveAdvantagesEntity>[];
    final mainSlider = <MainSliderEntity>[];
    final centerSlider = <CenterSliderEntity>[];
    final bestProductSale = <ProductEntity>[];
    final dailyOfferProduct = <ProductEntity>[];
    final categoryList = <CategoryEntity>[];
    var home = HomeEntity();

    for (var element in (response.data["competitive_advantages"] as List)) {
      competitiveAdvantages.add(CompetitiveAdvantagesEntity.fromJson(element));
    }

    for (var element in (response.data["mainslider"] as List)) {
      mainSlider.add(MainSliderEntity.fromJson(element));
    }

    for (var element in (response.data["centerslider"] as List)) {
      centerSlider.add(CenterSliderEntity.fromJson(element));
    }

    for (var element in (response.data["best_selling_slider"] as List)) {
      bestProductSale.add(ProductEntity.fromJson(element));
    }

    for (var element in (response.data["daily_offer"] as List)) {
      dailyOfferProduct.add(ProductEntity.fromJson(element));
    }

    for (var element in (response.data["categories"] as List)) {
      categoryList.add(CategoryEntity.fromJson(element));
    }

    home.background_advantages = BackgroundAdvantagesEntity.fromJson(response.data["background_advantages"]);
    home.competitive_advantages = competitiveAdvantages;
    home.mainslider = mainSlider;
    home.centerslider = centerSlider;
    home.best_selling_slider = bestProductSale;
    home.daily_offer = dailyOfferProduct;
    home.categories = categoryList;

    return home;
  }
}
