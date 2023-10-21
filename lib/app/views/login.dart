
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:bama_fruit/app/views/home_view.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset('assets/images/bgLogin.jpg').image,
                  fit: BoxFit.cover,
                  opacity: 30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo5.png',
                    width: 150,
                    height: 90,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: height / 5,
                  ),
                  TextField(
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
                        prefixIcon: InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: () {
                            //TODO رفتن به صفحه جستجو برای نمایش محصول
                          },
                          child: const Icon(
                            Icons.phone_android,
                            color: Color.fromARGB(94, 0, 0, 0),
                          ),
                        ),
                        hintText: "شماره همراه خود را وارد کنید",
                        hintTextDirection: TextDirection.rtl),
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  TextField(
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
                        prefixIcon: InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: () {
                            //TODO رفتن به صفحه جستجو برای نمایش محصول
                          },
                          child: const Icon(
                            Icons.key,
                            color: Color.fromARGB(94, 0, 0, 0),
                          ),
                        ),
                        hintText: "کلمه عبور",
                        hintTextDirection: TextDirection.rtl),
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.home),
                          label:const Text(
                            "بازگشت",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                         ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.login),
                          label:const Text(
                            "ورود به برنامه",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
