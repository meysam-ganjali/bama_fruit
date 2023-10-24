import 'package:bama_fruit/app/controllers/home_controller.dart';
import 'package:bama_fruit/app/models/home/home_entity.dart';
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:bama_fruit/app/views/cart_view.dart';
import 'package:bama_fruit/app/views/login.dart';
import 'package:bama_fruit/app/widgets/home/banner_widget.dart';
import 'package:bama_fruit/app/widgets/home/best_selling_widget.dart';
import 'package:bama_fruit/app/widgets/home/category_list_widget.dart';
import 'package:bama_fruit/app/widgets/home/center_slider_widget.dart';
import 'package:bama_fruit/app/widgets/home/daily_offer_product.dart';
import 'package:bama_fruit/app/widgets/home/main_slider_widget.dart';
import 'package:bama_fruit/app/widgets/primary_app_bar.dart';
import 'package:bama_fruit/app/widgets/primary_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = true;
  var homeFeatureList = HomeEntity();
  var _currentIndex = 1;

  @override
  void initState() {
    getAllFeatures();
    super.initState();
  }

  getAllFeatures() async {
    setState(() {
      isLoading = true;
    });
    final homeFearurelst = await HomeController.getFeatures();
    setState(() {
      homeFeatureList = homeFearurelst;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: !isLoading
            ? PreferredSize(
                preferredSize: const Size.fromHeight(65),
                child: PerimaryAppBar(width: width))
            : null,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: isLoading
              ? Container(
                  color: ThemeColors.primary,
                  height: height,
                  width: width,
                  child: const Center(
                    child: SpinKitFadingCube(
                      size: 80,
                      color: ThemeColors.onPrimary,
                    ),
                  ),
                )
              : Column(
                  children: [
                    //*Banner
                    BannerWidget(
                        width: width,
                        height: height,
                        homeFeatureList: homeFeatureList),
                    const SizedBox(
                      height: 15,
                    ),
                    //*Text input for search
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: ThemeColors.blue,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: ThemeColors.light,
                          suffixIcon: InkWell(
                            borderRadius: BorderRadius.circular(35),
                            onTap: () {
                              //TODO رفتن به صفحه جستجو برای نمایش محصول
                            },
                            child: const Icon(
                              CupertinoIcons.search,
                              color: Color.fromARGB(94, 0, 0, 0),
                            ),
                          ),
                          labelText: "دنبال چی میگردی؟",
                        ),
                      ),
                    ),

                    CategoryListWidget(
                        width: width, homeFeatureList: homeFeatureList),
                    MainSliderWidget(
                        mainSliders: homeFeatureList.mainslider, width: width),
                    BestSellingProductWidget(
                        width: width,
                        products: homeFeatureList.best_selling_slider),
                    CenterSliderWidget(sliders: homeFeatureList.centerslider),
                    DailyProductOffer(
                        width: width, products: homeFeatureList.daily_offer)
                  ],
                ),
        ),
        drawer: Drawer(
          child: PrimaryDrawer(height: height, width: width),
        ),
        bottomNavigationBar: !isLoading
            ? Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 181, 196, 202), blurRadius: 2)
                ]),
                child: SalomonBottomBar(
                  backgroundColor: ThemeColors.onPrimary,
                  currentIndex: _currentIndex,
                  onTap: (i) => setState(() => _currentIndex = i),
                  items: [
                    /// Home

                    SalomonBottomBarItem(
                      icon: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        Login(),
                              ));
                        },
                        child: const Icon(Icons.person),
                      ),
                      title: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        Login(),
                              ));
                        },
                        child: const Text(
                          "پنل",
                          style: TextStyle(fontFamily: 'sans'),
                        ),
                      ),
                      selectedColor: Colors.teal,
                    ),
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.home),
                      title: const Text(
                        "خانه",
                        style: TextStyle(fontFamily: 'sans'),
                      ),
                      selectedColor: Colors.purple,
                    ),

                    /// Likes
                    SalomonBottomBarItem(
                      icon: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartView(),
                            )),
                        child: const Icon(
                          Icons.shopping_basket,
                        ),
                      ),
                      title: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartView(),
                            )),
                        child: const Text(
                          "سبد خرید",
                          style: TextStyle(fontFamily: 'sans'),
                        ),
                      ),
                      selectedColor: Colors.orange,
                    ),

                    /// Search

                    /// Profile
                  ],
                ),
              )
            : null,
      ),
    );
  }
}