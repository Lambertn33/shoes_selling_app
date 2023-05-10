import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../../widgets/badgeContainerWidget.dart';

class CartShoeDetails extends StatefulWidget {
  const CartShoeDetails({super.key});

  @override
  State<CartShoeDetails> createState() => _CartShoeDetailsState();
}

class _CartShoeDetailsState extends State<CartShoeDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: const Color(0xFF475269).withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: 1),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, right: 40),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFF475269),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Image.asset(
                  '${Constants.imagesUrl}/shoes_1.png',
                  height: 130,
                  width: 130,
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Nike Shoe',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(blurRadius: 5, spreadRadius: 1),
                          ],
                        ),
                        child: Icon(CupertinoIcons.minus),
                      ),
                    ),
                    const Text(
                      '2',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(blurRadius: 5, spreadRadius: 1),
                          ],
                        ),
                        child: Icon(CupertinoIcons.plus),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                BadgeContainerWidget(
                  child: Icon(
                    CupertinoIcons.trash,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '50',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 24),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
