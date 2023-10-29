import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:bama_fruit/app/views/activation_account_view.dart';
import 'package:bama_fruit/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _userName = TextEditingController();
  String userName = "";
  String acvtivateCode = "";
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
                  const Center(
                    child: Text(
                      "ثبت نام",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _userName,
                    keyboardType: TextInputType.phone,
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
                  Center(
                    child: SizedBox(
                      width: width / 2,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          authRepository
                              .register(_userName.text)
                              .then((value) {
                            setState(() {
                              userName = value['number']!;
                              acvtivateCode = value['code']!;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ActivationAccountView(
                                    activateCode: acvtivateCode,
                                    userName: userName),
                              ),
                            );
                          });
                        },
                        icon: const Icon(Icons.person_add_alt),
                        label: const Text(
                          "ثبت نام",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
