
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryDrawer extends StatelessWidget {
  const PrimaryDrawer(
      {super.key,
      required this.height,
      required this.width});

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height * .2,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset("assets/images/drawerHead.jpg").image,
                  fit: BoxFit.fill)),
          child: Container(
            decoration: const BoxDecoration(color: ThemeColors.black),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.person,
                    color: ThemeColors.light,
                    size: 55,
                  ),
                  Text(
                    "سلام ",
                    style: const TextStyle(
                        color: ThemeColors.light,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    "userEntity.userName",
                    style: const TextStyle(
                        color: ThemeColors.light,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.shopping_cart,
                size: 35,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 5,
                  )
                ],
              ),
              SizedBox(
                width: width / 20,
              ),
              const Text(
                "لیست سفارشات",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.share_rounded,
                size: 35,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 5,
                  )
                ],
              ),
              SizedBox(
                width: width / 20,
              ),
              const Text(
                "معرفی به دوستان",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.person_pin_circle_outlined,
                size: 35,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 5,
                  )
                ],
              ),
              SizedBox(
                width: width / 20,
              ),
              const Text(
                "آدرس ها",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
    
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.person_outline_sharp,
                size: 35,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 5,
                  )
                ],
              ),
              SizedBox(
                width: width / 20,
              ),
              const Text(
                "پروفایل",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
