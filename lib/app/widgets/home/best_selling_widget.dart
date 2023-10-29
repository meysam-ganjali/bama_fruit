import 'package:bama_fruit/app/models/product/product_entity.dart';
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:bama_fruit/app/views/login.dart';
import 'package:bama_fruit/app/views/product_view.dart';
import 'package:bama_fruit/data/repositories/auth_repository.dart';
import 'package:bama_fruit/data/repositories/cart_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BestSellingProductWidget extends StatelessWidget {
  const BestSellingProductWidget({
    super.key,
    required this.width,
    required this.products,
  });

  final double width;
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "پرفروش ها",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: ThemeColors.black,
                ),
              ),
              Row(
                children: [
                  const Text("مشاهده همه",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: ThemeColors.blue)),
                  IconButton(
                    onPressed: () {
                      //TODO نمایش کل محصولات تخفیف دار در صفحه فروشگاه
                    },
                    icon: const Icon(
                      CupertinoIcons.arrow_left_square_fill,
                      color: ThemeColors.blue,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: width * .7,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    //TODO Navigate To Product View
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductView(productId: products[index].id),));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: width * .5,
                      decoration: BoxDecoration(
                          color: ThemeColors.light,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: ThemeColors.onPrimary,
                                blurRadius: 2,
                                blurStyle: BlurStyle.normal)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: width,
                                child: Image.network(
                                  products[index].image!,
                                  width: width * .15,
                                  height: width * .15,
                                ),
                              ),
                              Positioned(
                                  top: 0,
                                  left: 5,
                                  child: products[index].discount! > 0
                                      ? Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: ThemeColors.red),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 3),
                                            child: Text(
                                              " % ${products[index].discount}",
                                              style: const TextStyle(
                                                  color: ThemeColors.onPrimary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        )
                                      : Container())
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            products[index].title,
                            style: TextStyle(
                                shadows: const [
                                  Shadow(
                                      color: ThemeColors.black, blurRadius: 1),
                                ],
                                fontWeight: FontWeight.w700,
                                color: ThemeColors.primary.withOpacity(.7),
                                fontSize: width * .05),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          products[index].discount! > 0
                              ? Column(
                                  children: [
                                    Text(
                                      '${NumberFormat.decimalPattern().format(products[index].sale_price)}  تومان',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: ThemeColors.black,
                                        fontSize: width * .04,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    Text(
                                      '${products[index].price_after_discount}  تومان',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: ThemeColors.red,
                                        fontSize: width * .04,
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  '${NumberFormat.decimalPattern().format(products[index].sale_price)}  تومان',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: ThemeColors.black,
                                    fontSize: width * .04,
                                  ),
                                ),
                          ElevatedButton.icon(
                            onPressed: () async{
                              if(AuthRepository.authChangeNotifier.value != null){
                                final cartResponce = await cartRepository.addItem(products[index].id);
                                print(cartResponce);
                              }else{
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                              }
                            },
                            icon: const Icon(CupertinoIcons.shopping_cart),
                            label: const Text("افزودن به سبد"),
                          ),
                        ],
                      ),
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
