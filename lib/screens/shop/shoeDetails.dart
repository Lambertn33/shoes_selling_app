import 'package:flutter/material.dart';
import 'package:shoes_app_ui/models/shoe_model.dart';

class ShoeDetails extends StatefulWidget {
  final Shoe shoe;
  const ShoeDetails({required this.shoe,super.key});

  @override
  State<ShoeDetails> createState() => _ShoeDetailsState();
}

class _ShoeDetailsState extends State<ShoeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('details page')),
    );
  }
}