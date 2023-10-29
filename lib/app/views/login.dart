import 'package:bama_fruit/app/models/auth/login_entity.dart';
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:bama_fruit/app/views/home_view.dart';
import 'package:bama_fruit/app/views/register_view.dart';
import 'package:bama_fruit/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height / 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo5.png',
                        width: 150,
                        height: 90,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 15,),
                     const Text(
                        "خوش آمدید",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.black),
                      ),
                       const SizedBox(height: 10,),
                     const Text(
                        "لطفا وارد حساب کاربری خود شوید",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _userName,
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
                          Icons.phone_android,
                          color: Color.fromARGB(94, 0, 0, 0),
                        ),
                        hintText: "شماره همراه خود را وارد کنید",
                        hintTextDirection: TextDirection.rtl),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _passwordTextFild(password: _password),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        LoginParameter loginParam = LoginParameter(
                            userName: _userName.text, passwprd: _password.text);
                        authRepository
                            .login(loginParam)
                            .then((value) {
                        
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeView(),
                                ));
                          
                        });
                      },
                      icon: const Icon(Icons.login),
                      label: const Text(
                        "ورود به برنامه",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterView(),
                                ));
                          },
                          child: Text(
                            "ثبت نام",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          )),
                      Text("حساب کاربری ندارید؟"),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class _passwordTextFild extends StatefulWidget {
  const _passwordTextFild({
    super.key,
    required TextEditingController password,
  }) : _password = password;

  final TextEditingController _password;

  @override
  State<_passwordTextFild> createState() => _passwordTextFildState();
}

class _passwordTextFildState extends State<_passwordTextFild> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._password,
      obscureText: obsecureText,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: ThemeColors.blue, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: ThemeColors.light,
          prefixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obsecureText = !obsecureText;
                });
              },
              icon: Icon(obsecureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined)),
          hintText: "کلمه عبور",
          hintTextDirection: TextDirection.rtl),
      textDirection: TextDirection.rtl,
    );
  }
}
