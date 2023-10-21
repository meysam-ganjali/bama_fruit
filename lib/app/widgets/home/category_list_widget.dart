
import 'package:bama_fruit/app/models/home/home_entity.dart';
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
    required this.width,
    required this.homeFeatureList,
  });

  final double width;
  final HomeEntity homeFeatureList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("همه دسته بندی ها",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: ThemeColors.black)),
              InkWell(
                onTap: () {
                  //TODO Navigate To Shop Page
                },
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("مشاهده همه",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: ThemeColors.blue)),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.arrow_left_square_fill,
                        color: ThemeColors.blue,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: width * .2/1.2,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: homeFeatureList.categories.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    //TODO Navigate To Shop With Category Id
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: width * .4,
                   // height: width * .2,
                    decoration: BoxDecoration(
                      color: ThemeColors.light,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(width / 10),
                          child: Image.network(
                            homeFeatureList.categories[index].image!,
                            width: width/10,
                            height: width/10,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          homeFeatureList.categories[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: ThemeColors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
