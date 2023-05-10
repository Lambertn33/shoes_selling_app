import 'package:flutter/material.dart';

class BadgeContainerWidget extends StatefulWidget {
  final dynamic child;
  const BadgeContainerWidget({required this.child, super.key});

  @override
  State<BadgeContainerWidget> createState() => _BadgeContainerWidgetState();
}

class _BadgeContainerWidgetState extends State<BadgeContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF475269).withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: widget.child);
  }
}
