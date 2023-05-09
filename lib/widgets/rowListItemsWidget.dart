import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app_ui/models/shoe_model.dart';

class RowListItemsWidget extends StatefulWidget {
  final List <Shoe> shoesList;
  const RowListItemsWidget({required this.shoesList, super.key});

  @override
  State<RowListItemsWidget> createState() => _RowListItemsWidgetState();
}

class _RowListItemsWidgetState extends State<RowListItemsWidget> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < widget.shoesList.length; i++)
            Container(
              margin: const EdgeInsets.only(top: 10, left: 25),
              padding: const EdgeInsets.all(12),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xFF475269).withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1),
                ],
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 140,
                        margin: const EdgeInsets.only(top: 50, right: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF475269),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Image.asset(
                        widget.shoesList[i].imageUrl,
                        height: 180,
                        width: 160,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.shoesList[i].title,
                          style: const TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.w700),
                        ),
                        Text(
                           widget.shoesList[i].category,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '€ ${widget.shoesList[i].price}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF475269),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Icon(
                                CupertinoIcons.cart_fill,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
