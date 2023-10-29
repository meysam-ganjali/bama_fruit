import 'package:bama_fruit/app/models/product/product_entity.dart';
import 'package:bama_fruit/app/models/user/user_entity.dart';
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:bama_fruit/app/views/login.dart';
import 'package:bama_fruit/app/widgets/primary_app_bar.dart';
import 'package:bama_fruit/data/repositories/auth_repository.dart';
import 'package:bama_fruit/data/repositories/cart_repository.dart';
import 'package:bama_fruit/data/repositories/product_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class ProductView extends StatefulWidget {
  final int productId;
   ProductView({super.key,required this.productId});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool isLoading = true;
  ProductEntity? product;
  @override
  void initState() {
    getProductDetiales();
    super.initState();
  }
  getProductDetiales() async{

    final productFromServer = await productRepository.productDetials(id: widget.productId);
  
    setState(() {
      product = productFromServer;
     
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: PerimaryAppBar(width: width),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: isLoading ?const Center(child:  CircularProgressIndicator()):   Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: width,
                  height: width / 1.8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:  Image.network(product!.image).image,
                          fit: BoxFit.fill)),
                ),
              const  SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    product!.title ,
                    style:const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: product!.discount! > 0 
                  ? Column(
                    children: [
                      Text("${product!.sale_price}  تومان",style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),),
                      Text("${product!.price_after_discount}  تومان",style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent
                      )),
                    ],
                  )
                  :  Text("${product!.sale_price}  تومان",style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                        decIconDecoration:const BoxDecoration(
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
                    const Text(
                      "کیلو",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    ElevatedButton.icon(
                        onPressed: ()async {
                           if(AuthRepository.authChangeNotifier.value != null){
                                final cartResponce = await cartRepository.addItem(product!.id);
                                print(cartResponce);
                              }else{
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                              }
                        },
                        icon: const Icon(CupertinoIcons.shopping_cart),
                        label: const Text("افزودن به سبد")),
                  ],
                ),
                const Divider(),
                const Text(
                  "توضیحات",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(product!.long_description!)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
