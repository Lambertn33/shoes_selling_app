import 'package:flutter/material.dart';
import 'package:shoes_app_ui/helpers/showSnackBar.dart';
import 'package:shoes_app_ui/models/cart_model.dart';
import 'package:shoes_app_ui/screens/cart/cartDetails.dart';

import '../../services/shoe_services.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<Cart> shoesInMyCart = [];
  bool isListEmpty = true;
  int subTotal = 0;
  int shippingFee = 0;
  int grandTotal = 0;

  void getShoesInMyCart() {
    List<Cart> shoes = ShoeServices.getShoesInMyCart();
    if (shoes.isNotEmpty) {
      int newShippingFee = 5;
      for (int i = 0; i < shoes.length; i++) {
        subTotal = subTotal + shoes[i].shoe.price;
        grandTotal = subTotal + newShippingFee;
      }
      setState(() {
        shoesInMyCart = shoes;
        isListEmpty = false;
        shippingFee = newShippingFee;
        subTotal = subTotal;
      });
    }
  }

  void deleteShoeInMyCart(int shoeId) {
    int newShippingFee = 5;
    ShoeServices.removeShoeInCart(shoeId);
    final updatedList =
        shoesInMyCart.where((element) => element.shoe.id != shoeId).toList();
        for (int i = 0; i < updatedList.length; i++) {
        subTotal = subTotal - updatedList[i].shoe.price;
        grandTotal = subTotal + newShippingFee;
      }
    if (updatedList.isEmpty) {
      setState(() {
        isListEmpty = true;
      });
    }
    setState(() {
      shoesInMyCart = updatedList;
    });
  }

  @override
  void initState() {
    super.initState();
    getShoesInMyCart();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: isListEmpty ? 200 : 600,
        decoration: const BoxDecoration(
          color: Color(0xFFcEDDEE),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (!isListEmpty) ...[
                for (var shoeInMyCart in shoesInMyCart) ...[
                  CartShoeDetails(
                      shoeInMyCart: shoeInMyCart,
                      removeShoeFromMyCart: deleteShoeInMyCart)
                ],
                Container(
                  height: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF475269).withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 1),
                    ],
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sub-total',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '$subTotal',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const Divider(
                      height: 20,
                      thickness: 0.8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Shipping',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '$shippingFee',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const Divider(
                      height: 20,
                      thickness: 0.8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Grand total',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '$grandTotal',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const Divider()
                  ]),
                )
              ] else ...[
                Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: Text(
                    'Your cart is empty',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.red),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
