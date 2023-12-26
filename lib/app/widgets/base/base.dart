import 'package:app_vbot/constant.dart';
import 'package:flutter/material.dart';

class HBaseSpace extends StatelessWidget {
  const HBaseSpace({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: kDefaultSpace);
  }
}

class HMinSpace extends StatelessWidget {
  const HMinSpace({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: kMinSpace);
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    // final theme = FluentTheme.of(context);
    return Text(
      text,
      // style: theme.typography.subtitle,
      style: const TextStyle(
        fontSize: 20,
        // color: colorScheme.background,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.start,
    );
  }
}

class VBaseSpace extends StatelessWidget {
  const VBaseSpace({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: kDefaultSpace);
  }
}
