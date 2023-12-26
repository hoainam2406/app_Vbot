import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonRefreshVBot extends StatelessWidget {
  const ButtonRefreshVBot({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: VPMOutlinedButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(0),
        child: const Icon(
          CupertinoIcons.refresh,
          size: 20,
        ),
      ),
    );
  }
}

class ButtonAddVBot extends StatelessWidget {
  const ButtonAddVBot({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: VPMOutlinedButtonAdd2(
        onPressed: onPressed,
        padding: const EdgeInsets.all(0),
        child: const Icon(
          CupertinoIcons.add,
          size: 20,
        ),
      ),
    );
  }
}

class ButtonDeleteVBot extends StatelessWidget {
  const ButtonDeleteVBot({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: VPMOutlinedButtonDelete2(
        onPressed: onPressed,
        padding: const EdgeInsets.all(0),
        child: const Icon(
          CupertinoIcons.delete,
          size: 20,
        ),
      ),
    );
  }
}

class BoxLoadingVBot extends StatelessWidget {
  const BoxLoadingVBot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: .3, color: borderColor),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(6),
      child: const Icon(
        CupertinoIcons.check_mark_circled_solid,
        size: 20,
        color: Colors.blue,
      ),
    );
  }
}

class ButtonVBot extends StatelessWidget {
  const ButtonVBot(
      {super.key,
      required this.onPressed,
      required this.child,
      this.tooltip,
      this.width});
  final VoidCallback onPressed;
  final Widget child;
  final String? tooltip;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 32,
      height: 32,
      child: VPMOutlinedButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(0),
        child: child,
      ),
    );
  }
}

class BoxLoading extends StatelessWidget {
  const BoxLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12,
              ),
              border: Border.all(width: .3, color: borderColor),
            ),
            padding: const EdgeInsets.all(6),
            child: const CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.only(top: 2),
          //   width: 32,
          //   height: 32,
          //   child: const Icon(
          //     CupertinoIcons.check_mark_circled_solid,
          //     size: 20,
          //     color: Colors.blue,
          //   ),
          // ),
        ],
      ),
    );
  }
}
