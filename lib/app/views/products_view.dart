import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:bama_fruit/app/views/cart_view.dart';
import 'package:bama_fruit/app/views/login.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});
  
  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  var _currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: Container(
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
                      SalomonBottomBarItem(
                        icon: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductsView(),
                              )),
                          child: const Icon(
                            Icons.shopify_outlined,
                          ),
                        ),
                        title: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductsView(),
                              )),
                          child: const Text(
                            "فروشگاه",
                            style: TextStyle(fontFamily: 'sans'),
                          ),
                        ),
                        selectedColor: ThemeColors.primary,
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}