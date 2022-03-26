import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color bgColor;
  final Widget child;
  final Function onTap;
  ReusableCard({
    this.bgColor, 
    this.child,
    this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: child,
              ),
      ),
    );
  }
}