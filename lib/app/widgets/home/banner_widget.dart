
import 'package:bama_fruit/app/models/home/home_entity.dart';
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.width,
    required this.height,
    required this.homeFeatureList,
  });

  final double width;
  final double height;
  final HomeEntity homeFeatureList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * .2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
            image: Image.network(
                    homeFeatureList.background_advantages.image)
                .image,
            fit: BoxFit.fill),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.black.withOpacity(.1),
              Colors.black.withOpacity(.6),
            ]
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    homeFeatureList
                        .competitive_advantages[0].title!,
                    style: TextStyle(
                        color: ThemeColors.onPrimary,
                        fontSize: width / 20,
                        fontFamily: 'sans',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    homeFeatureList
                        .competitive_advantages[1].title!,
                    style: TextStyle(
                        color: ThemeColors.onPrimary,
                        fontSize: width / 20,
                        fontFamily: 'sans',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "میوه با ما",
                style: TextStyle(
                    shadows: const [
                      Shadow(
                          color: ThemeColors.onPrimary,
                          blurRadius: 5),
                      Shadow(
                          color: ThemeColors.secondary,
                          blurRadius: 7),
                      Shadow(
                          color: ThemeColors.primary,
                          blurRadius: 3)
                    ],
                    color: ThemeColors.onPrimary,
                    fontSize: width / 20,
                    fontFamily: 'sans',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    homeFeatureList
                        .competitive_advantages[2].title!,
                    style: TextStyle(
                        color: ThemeColors.onPrimary,
                        fontSize: width / 20,
                        fontFamily: 'sans',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    homeFeatureList
                        .competitive_advantages[3].title!,
                    style: TextStyle(
                        color: ThemeColors.onPrimary,
                        fontSize: width / 20,
                        fontFamily: 'sans',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
