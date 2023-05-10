import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app_ui/models/cart_model.dart';
import '../../widgets/badgeContainerWidget.dart';

class CartShoeDetails extends StatefulWidget {
  final Cart shoeInMyCart;
  final Function removeShoeFromMyCart;
  const CartShoeDetails({required this.removeShoeFromMyCart, required this.shoeInMyCart, super.key});

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
                  widget.shoeInMyCart.shoe.imageUrl,
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
                  widget.shoeInMyCart.shoe.title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Size: ${widget.shoeInMyCart.size}',
                  style: const TextStyle(fontSize: 15,
                  color: Colors.red, fontWeight: FontWeight.bold),
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
              children: [
                InkWell(
                  onTap: (){
                    widget.removeShoeFromMyCart(widget.shoeInMyCart.shoe.id);
                  },
                  child: const BadgeContainerWidget(
                    child: Icon(
                      CupertinoIcons.trash,
                      color: Colors.red,
                    ),
                  ),
                ),
                Text(
                  '€ ${widget.shoeInMyCart.shoe.price}',
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
