import 'package:flutter/material.dart';
import 'package:shoes_app_ui/models/shoe_model.dart';
import 'package:shoes_app_ui/widgets/badgeContainerWidget.dart';

class ShoeDetails extends StatefulWidget {
  final Shoe shoe;
  const ShoeDetails({required this.shoe, super.key});

  @override
  State<ShoeDetails> createState() => _ShoeDetailsState();
}

class _ShoeDetailsState extends State<ShoeDetails> {
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
              height: 270,
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
                children: [Row(children: [
                  Text(widget.shoe.title, style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),),
                  const Spacer(),
                  Text('€ ${widget.shoe.price}', style: const TextStyle(
                    fontSize: 24,
                    color: Colors.red,
                    fontWeight: FontWeight.w600
                  ),),

                ],)],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
