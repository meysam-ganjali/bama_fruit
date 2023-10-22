import 'package:bama_fruit/app/models/register/register_entity.dart';
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:bama_fruit/data/repositories/register_repository.dart';
import 'package:flutter/material.dart';

class ActivationAccountView extends StatelessWidget {
  final String userName;
  final String activateCode;
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _activaCode = TextEditingController();
  ActivationAccountView({required this.activateCode,required this.userName});

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 25,),
                  Text(activateCode),
                  SizedBox(height: 25,),
                  TextField(
                    controller: _fullname,
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
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color.fromARGB(94, 0, 0, 0),
                        ),
                        hintText: "نام و نام خانوادگی",
                        hintTextDirection: TextDirection.rtl),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _password,
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
                        prefixIcon: const Icon(
                          Icons.key_sharp,
                          color: Color.fromARGB(94, 0, 0, 0),
                        ),
                        hintText: "کلمه عبور",
                        hintTextDirection: TextDirection.rtl),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 
                  TextField(
                    controller: _activaCode,
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
                        prefixIcon: const Icon(
                          Icons.keyboard,
                          color: Color.fromARGB(94, 0, 0, 0),
                        ),
                        hintText: "کد پیامک شده را وارد کنید",
                        hintTextDirection: TextDirection.rtl),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: () {
                    registerRepository.activateAccount(registerEntity: RegisterEntity(username: userName, fullname: _fullname.text, password: _password.text, active_code: _activaCode.text));
                  }, child: Text("فعال سازی حساب"))
                ],
              )),
        ),
      ),
    );
  }
}
