import 'package:flutter/material.dart';
import 'package:shoes_app_ui/helpers/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void navigateToHomePage() {
    Navigator.pushNamed(context, "/homepage");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset('${Constants.imagesUrl}/login.png'),
              ),
              // first input
              inputWidget(const Icon(Icons.person), "enter username", false),
              const SizedBox(height: 24),
              // second input
              inputWidget(const Icon(Icons.lock), "enter password", true),
              const SizedBox(height: 12),
              Container(
                margin: const EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot password ?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: navigateToHomePage,
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF475269),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF475269).withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 1),
                    ],
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don t have an account',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: (){},
                    child: const Text(
                      'Sign up',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Input
  Container inputWidget(Icon icon, String hintText, bool obscureText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F9FD),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF475269).withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 250,
            child: TextFormField(
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
