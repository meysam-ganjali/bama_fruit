import 'package:bama_fruit/app/models/home/main_slider_entity.dart';
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainSliderWidget extends StatelessWidget {
  final PageController _pageController = PageController();
  MainSliderWidget({super.key, required this.mainSliders, required this.width});

  final List<MainSliderEntity> mainSliders;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: AspectRatio(
        aspectRatio: 2,
        child: Stack(
          children: [
            PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              itemCount: mainSliders.length,
              itemBuilder: (context, index) => _Slide(
                mainSlider: mainSliders[index],
                
              ),
            ),
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                    controller: _pageController,
                    count: mainSliders.length,
                    axisDirection: Axis.horizontal,
                    effect: const SlideEffect(
                        spacing: 5.0,
                        radius: 4.0,
                        dotWidth: 35.0,
                        dotHeight: 8.0,
                        paintStyle: PaintingStyle.fill,
                        strokeWidth: 1.5,
                        dotColor: ThemeColors.light,
                        activeDotColor: ThemeColors.primary)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.mainSlider,
  });

  final MainSliderEntity mainSlider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: Image.network(mainSlider.image!).image, fit: BoxFit.fill),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: SweepGradient(
              tileMode: TileMode.repeated,
              colors: [
                ThemeColors.black,
                ThemeColors.onSecondary.withOpacity(.5),
                ThemeColors.black,
                ThemeColors.blue.withOpacity(.6),
                ThemeColors.black,
                Colors.purple.withOpacity(.6),
                ThemeColors.black,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  mainSlider.title!,
                  style: const TextStyle(
                    fontFamily: 'sans',
                    color: ThemeColors.light,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Text(
                  mainSlider.description!,
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
    );
  }
}
