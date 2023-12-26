import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:flutter/material.dart';

class VPMSelectionWidget extends StatelessWidget {
  const VPMSelectionWidget(
      {super.key,
      required this.select,
      required this.child,
      this.padding,
      this.borderRadius});

  final bool select;
  final Widget child;
  final EdgeInsets? padding;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration: BoxDecoration(
          color: select ? const Color(0x33959595) : Colors.transparent,
          // border: const Border(
          //   bottom: BorderSide(),
          // ),
          borderRadius: BorderRadius.circular(borderRadius ?? 0)),
      child: child,
    );
  }
}
