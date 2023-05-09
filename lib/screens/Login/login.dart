import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset('assets/images/login.png'),
              ),
              // first input
              Container(
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
                        spreadRadius: 1)
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 27,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Username",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
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
                    const Icon(
                      Icons.lock,
                      size: 27,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Password",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                margin: const EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
