import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app_ui/models/shoe_model.dart';

class FeaturedShoesList extends StatefulWidget {
  final List<Shoe> shoesList;
  const FeaturedShoesList({required this.shoesList, super.key});

  @override
  State<FeaturedShoesList> createState() => _FeaturedShoesListState();
}

class _FeaturedShoesListState extends State<FeaturedShoesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Featured shoes',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        GridView.count(
          childAspectRatio: 0.72,
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            for (int i = 0; i < widget.shoesList.length; i++)
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
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
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        widget.shoesList[i].imageUrl,
                        height: 90,
                        width: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        widget.shoesList[i].title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        widget.shoesList[i].category,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '€ ${widget.shoesList[i].price}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF475269),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/shoeDetails",
                                  arguments: widget.shoesList[i]);
                            },
                            child: const Icon(
                              CupertinoIcons.eye,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
