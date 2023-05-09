import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App navbar icons
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    badgeContainer(
                      const Icon(
                        Icons.sort,
                        size: 30,
                      ),
                    ),
                    badgeContainer(
                      const badges.Badge(
                        badgeContent: Text(
                          '3',
                          style: TextStyle(color: Colors.white),
                        ),
                        child: Icon(Icons.notifications),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFF475269).withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1),
                  ],
                ),
                child: Row(
                  children: [                  
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search'
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.search)
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container badgeContainer(child) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF475269).withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: child);
  }
}