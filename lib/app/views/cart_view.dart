import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:bama_fruit/app/views/home_view.dart';
import 'package:bama_fruit/app/views/login.dart';
import 'package:bama_fruit/app/widgets/primary_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  var _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: PerimaryAppBar(width: width),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                _cartItem(width),
                _cartItem(width),
                _cartItem(width),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(color: Color.fromARGB(255, 181, 196, 202), blurRadius: 2)
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
                icon: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ));
                    },
                    child: const Icon(Icons.home)),
                title: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeView(),
                        ));
                  },
                  child: const Text(
                    "خانه",
                    style: TextStyle(fontFamily: 'sans'),
                  ),
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
        ),
      ),
    );
  }

  Container _cartItem(double width) {
    return Container(
      width: width,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: ThemeColors.light, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/logo5.png',
                width: 65,
                height: 65,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "دراگون فروت استوایی",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      width: width * .2,
                      child: NumberInputWithIncrementDecrement(
                        min: .5,
                        max: 100,
                        initialValue: 1,
                        incDecFactor: 0.5,
                        isInt: false,
                        controller: TextEditingController(),
                        numberFieldDecoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        widgetContainerDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: ThemeColors.primary,
                              width: 2,
                            )),
                        incIconDecoration: BoxDecoration(
                          color: ThemeColors.primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        separateIcons: true,
                        decIconDecoration: BoxDecoration(
                          color: ThemeColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        incIconSize: 28,
                        decIconSize: 28,
                        incIcon: CupertinoIcons.add,
                        decIcon: CupertinoIcons.minus,
                        decIconColor: ThemeColors.onPrimary,
                        incIconColor: ThemeColors.onPrimary,
                        scaleHeight: 0.90,
                        buttonArrangement: ButtonArrangement.leftEnd,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("کیلو گرم")
                  ],
                ),
                Text(
                  "120,000 تومان",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
