import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app_ui/screens/cart/cartWidget.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class HomeBottomBarWidget extends StatelessWidget {
  const HomeBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
          color: Color(0xFF475269),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: () {
                showSlidingBottomSheet(
                  context,
                  builder: (context) {
                    return SlidingSheetDialog(
                        elevation: 8,
                        cornerRadius: 16,
                        builder: (context, state) {
                          return const MyCart();
                        });
                  },
                );
              },
              child: const Icon(
                CupertinoIcons.cart_fill,
                size: 30,
                color: Colors.white,
              )),
          const Icon(
            Icons.favorite_border,
            size: 30,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
