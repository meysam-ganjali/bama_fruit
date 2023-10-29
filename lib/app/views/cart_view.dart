import 'package:bama_fruit/app/models/user/user_entity.dart';
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:bama_fruit/app/views/home_view.dart';
import 'package:bama_fruit/app/views/login.dart';
import 'package:bama_fruit/app/views/products_view.dart';
import 'package:bama_fruit/app/widgets/primary_app_bar.dart';
import 'package:bama_fruit/data/repositories/auth_repository.dart';
import 'package:bama_fruit/data/repositories/cart_repository.dart';
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
  bool isLoading = true;
  int totalPrice = 0;
  var carts = <UserCartEntity>[];
    @override
  void initState() {
    getUserCart();
    super.initState();
  }
  getUserCart()async{
    var res = await cartRepository.getCart();
   setState(() {
      for (var element in res) {
        carts.add(element);
        totalPrice += int.parse(element.priceAfterDiscount);
        }
      isLoading=false;
   });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: PerimaryAppBar(width: width),
        ),
        body: AuthRepository.authChangeNotifier.value == null 
        ? const Center(child: Text("به حساب کاربری خود وارد شوید"),)
        :SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            isLoading
            ? const CircularProgressIndicator()
            : Column(
              children: [
               if (carts.isEmpty) Container(
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(.5),borderRadius: BorderRadius.circular(10)
                ),
                child:const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text("سبد خالی است"),
                )) 
               else ...carts.map((element) => _cartItem(width, element),),
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: ThemeColors.light,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                           const Text("مبلغ قابل پرداخت :",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: ThemeColors.black
                            )),
                            Text("${totalPrice}  تومان",style:const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ThemeColors.red
                            ),),
                          ],
                        ),
                       const SizedBox(height: 15,),
                        ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.money), label: const Text("نهایی کردن سفارش"))
                      ],
                    ),
                  ),
                )
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
                            builder: (context) => const HomeView(),
                          ));
                    },
                    child: const Icon(Icons.home)),
                title: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
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
                        builder: (context) => const CartView(),
                      )),
                  child: const Icon(
                    Icons.shopping_basket,
                  ),
                ),
                title: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartView(),
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
                              builder: (context) => const ProductsView(),
                            )),
                        child: const Icon(
                          Icons.shopify_outlined,
                        ),
                      ),
                      title: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>const ProductsView(),
                            )),
                        child: const Text(
                          "فروشگاه",
                          style: TextStyle(fontFamily: 'sans'),
                        ),
                      ),
                      selectedColor: ThemeColors.primary,
                    )
            ],
          ),
        ),
      ),
    );
  }

  Container _cartItem(double width,UserCartEntity userCart) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: ThemeColors.light, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                userCart.image,
                width: 70,
                height: 70,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child:  Text(
                  userCart.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              IconButton(onPressed: (){
                //Delete item
              }, icon:const Icon(CupertinoIcons.trash,color: Colors.redAccent,))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SizedBox(
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: ThemeColors.primary,
                              width: 2,
                            )),
                        incIconDecoration: const BoxDecoration(
                          color: ThemeColors.primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        separateIcons: true,
                        decIconDecoration: const BoxDecoration(
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
                    const SizedBox(
                      width: 10,
                    ),
                     Text(userCart.productUnit)
                  ],
                ),
                 Text(
                  "${userCart.priceAfterDiscount} تومان",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
