import 'package:flutter/material.dart';
import 'package:shoes_app_ui/helpers/showSnackBar.dart';
import 'package:shoes_app_ui/models/cart_model.dart';
import 'package:shoes_app_ui/models/shoe_model.dart';
import 'package:shoes_app_ui/services/shoe_services.dart';
import 'package:shoes_app_ui/widgets/badgeContainerWidget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShoeDetails extends StatefulWidget {
  final Shoe shoe;
  const ShoeDetails({required this.shoe, super.key});

  @override
  State<ShoeDetails> createState() => _ShoeDetailsState();
}

class _ShoeDetailsState extends State<ShoeDetails> {
  int selectedShoeSize = 5;

  void updateSelectedShoe(size) {
    setState(() {
      selectedShoeSize = size;
    });
  }

  void addShoeToCart(Shoe shoe) {
    bool checkShoe = ShoeServices.checkIfShoeExistsInCart(shoe);
    if (checkShoe) {
      showSnackBar(context, 'shoe exists in your cart', Colors.red);
    } else {
      Cart newShoeToAddInCart = Cart(shoe: shoe, size: selectedShoeSize);
      ShoeServices.addShoeInCart(newShoeToAddInCart);
      showSnackBar(context, 'shoe added in cart', Colors.green);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const BadgeContainerWidget(
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                  ),
                  const BadgeContainerWidget(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    height: 230,
                    width: 230,
                    decoration: BoxDecoration(
                      color: const Color(0xFF475269),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Image.asset(
                    widget.shoe.imageUrl,
                    height: 300,
                    width: 300,
                    fit: BoxFit.contain,
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF475269).withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.shoe.title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: InkWell(
                          onTap: () {
                            addShoeToCart(widget.shoe);
                          },
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: RatingBar.builder(
                        initialRating: 2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemSize: 20,
                        itemCount: 6,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, _) => const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 16,
                            ),
                        onRatingUpdate: (index) {}),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '€ ${widget.shoe.price}',
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    'Random description of the shoe Random description of'
                    'the shoeRandom description of the shoe Random description',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Size:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      for (int i = 5; i < 11; i++)
                        InkWell(
                          onTap: () {
                            updateSelectedShoe(i);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 7),
                            height: 35,
                            width: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedShoeSize == i
                                  ? Colors.red
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(blurRadius: 5, spreadRadius: 1),
                              ],
                            ),
                            child: Text(
                              '$i',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
