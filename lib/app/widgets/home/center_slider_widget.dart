

import 'package:bama_fruit/app/models/home/center_slider_entity.dart';
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterSliderWidget extends StatelessWidget {
  const CenterSliderWidget({
    super.key,
    required this.sliders,
  });

  final List<CenterSliderEntity> sliders;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CarouselSlider(
          items: sliders
              .map((item) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: Image.network(item.image!).image,
                              fit: BoxFit.cover),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black.withOpacity(.2)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ThemeColors.black
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.title!,
                                    style: const TextStyle(
                                      fontFamily: 'sans',
                                      color: ThemeColors.light,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                  Text(
                                    item.description!,
                                    style: const TextStyle(
                                      fontFamily: 'sans',
                                      color: ThemeColors.light,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            //enlargeCenterPage: true,
            autoPlay: true,
            height: 180,
            aspectRatio: 2.0,
          ),
        ),
      ),
    );
  }
}
