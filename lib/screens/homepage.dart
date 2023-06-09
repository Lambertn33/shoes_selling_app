import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shoes_app_ui/models/cart_model.dart';
import 'package:shoes_app_ui/models/shoe_model.dart';
import 'package:shoes_app_ui/screens/shop/featuredShoes.dart';
import 'package:shoes_app_ui/screens/shop/latestShoes.dart';
import 'package:shoes_app_ui/services/shoe_services.dart';
import 'package:shoes_app_ui/widgets/badgeContainerWidget.dart';
import 'package:shoes_app_ui/widgets/bottomBarWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Shoe> shoesList = [];
  List<Cart> shoesInMyCart = [];

  void getShoesServices() {
    shoesList = ShoeServices.getShoesList();
  }


  @override
  void initState() {
    super.initState();
    getShoesServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeBottomBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App navbar icons
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    BadgeContainerWidget(
                      child: Icon(
                        Icons.sort,
                        size: 30,
                      ),
                    ),
                    BadgeContainerWidget(
                      child: badges.Badge(
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
                            border: InputBorder.none, hintText: 'Search'),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.search)
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              // horizontal List
              LatestShoesPage(
                shoesList: shoesList,
              ),
              const SizedBox(
                height: 35,
              ),
              FeaturedShoesList(shoesList: shoesList)
            ],
          ),
        ),
      ),
    );
  }
}
