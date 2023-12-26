import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardVbot extends StatelessWidget {
  const CardVbot({super.key, required this.child, this.padding, this.border});

  final Widget child;
  final EdgeInsets? padding;
  final ShapeBorder? border;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: border ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(
              width: .3,
              color: borderColor,
            ),
          ),
      shadowColor: Colors.transparent,
      margin: EdgeInsets.zero,
      child: Container(
        margin: const EdgeInsets.all(0),
        padding: padding ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: child,
      ),
    );
  }
}

class CardVPM extends StatelessWidget {
  const CardVPM({super.key, required this.child, this.padding, this.border});

  final Widget child;
  final EdgeInsets? padding;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: border ??
            Border.all(
              width: .3,
              color: borderColor,
            ),
        borderRadius: BorderRadius.circular(12),
        // color: const Color(0xFFF3F3F3),
      ),
      child: child,
    );
  }
}
