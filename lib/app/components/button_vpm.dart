import 'package:app_vbot/constant.dart';
import 'package:flutter/material.dart';

class VPMElevatedButton extends StatelessWidget {
  const VPMElevatedButton(
      {super.key, required this.child, required this.onPressed});
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

class VPMOutlinedButton extends StatelessWidget {
  const VPMOutlinedButton(
      {super.key, required this.child, this.padding, required this.onPressed});
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        iconColor: const MaterialStatePropertyAll(Colors.black),
        padding: MaterialStatePropertyAll(
          padding ?? const EdgeInsets.all(8),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        side: MaterialStatePropertyAll(
          BorderSide(width: .3, color: borderColor),
        ),
        foregroundColor: const MaterialStatePropertyAll(
          Colors.black,
        ),
      ),
      child: child,
    );
  }
}

class VPMOutlinedButtonDelete extends StatelessWidget {
  const VPMOutlinedButtonDelete(
      {super.key, required this.text, this.padding, required this.onPressed});
  final String text;
  final EdgeInsets? padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.red),
        iconColor: const MaterialStatePropertyAll(Colors.black),
        padding: MaterialStatePropertyAll(
            padding ?? const EdgeInsets.fromLTRB(10, 16, 10, 16)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: Text(
        text,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class VPMOutlinedButtonDelete2 extends StatelessWidget {
  const VPMOutlinedButtonDelete2(
      {super.key, required this.child, this.padding, required this.onPressed});
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Colors.red),
          iconColor: const MaterialStatePropertyAll(Colors.black),
          padding: MaterialStatePropertyAll(
            padding ?? const EdgeInsets.all(8),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          side: const MaterialStatePropertyAll(BorderSide.none)),
      child: child,
    );
  }
}

class VPMOutlinedButtonAdd extends StatelessWidget {
  const VPMOutlinedButtonAdd(
      {super.key, required this.text, this.padding, required this.onPressed});
  final String text;
  final EdgeInsets? padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.green),
        iconColor: const MaterialStatePropertyAll(Colors.black),
        padding: MaterialStatePropertyAll(
            padding ?? const EdgeInsets.fromLTRB(10, 16, 10, 16)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: Text(
        text,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class VPMOutlinedButtonAdd2 extends StatelessWidget {
  const VPMOutlinedButtonAdd2(
      {super.key, required this.child, this.padding, required this.onPressed});
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Color(0xFF74C577)),
          iconColor: const MaterialStatePropertyAll(Colors.black),
          padding: MaterialStatePropertyAll(padding ?? const EdgeInsets.all(8)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          side: MaterialStatePropertyAll(
              BorderSide(width: .3, color: borderColor))),
      child: child,
    );
  }
}

class VPMFilledButton extends StatelessWidget {
  const VPMFilledButton({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
        onPressed: () {},
        child: child);
  }
}

class VPMTextButton extends StatelessWidget {
  const VPMTextButton(
      {super.key, required this.child, required this.onPressed, this.style});
  final Widget child;
  final VoidCallback onPressed;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: style ??
            ButtonStyle(
              padding: const MaterialStatePropertyAll(
                EdgeInsets.all(0),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              foregroundColor: const MaterialStatePropertyAll(
                Colors.black,
              ),
              // iconColor: const MaterialStatePropertyAll(
              //   Colors.red,
              // ),
              // surfaceTintColor: const MaterialStatePropertyAll(
              //   Colors.red,
              // ),
              // overlayColor: const MaterialStatePropertyAll(
              //   Colors.red,
              // ),
            ),
        onPressed: onPressed,
        child: child);
  }
}

class VPMIconButton extends StatelessWidget {
  const VPMIconButton(
      {super.key, required this.icon, required this.onPressed, this.tooltip});
  final Widget icon;
  final VoidCallback onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      splashRadius: 20,
      onPressed: onPressed,
      icon: icon,
    );
  }
}

class VPMButton extends StatelessWidget {
  const VPMButton({super.key, required this.child, required this.onPressed});
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 32,
      constraints: const BoxConstraints(minWidth: 25),
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      // padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      decoration: BoxDecoration(
        // color: Colors.red,
        // borderRadius: BorderRadius.circular(12),
        // border: Border.all(
        //   width: .3,
        //   color: borderColor,
        // ),
        border: Border(
          bottom: BorderSide(
            width: .3,
            color: borderColor,
          ),
        ),
      ),
      child: InkWell(
        // borderRadius: BorderRadius.circular(12),
        customBorder: RoundedRectangleBorder(
          side: BorderSide(
            width: .3,
            color: borderColor,
          ),
          // borderRadius: BorderRadius.circular(12),
        ),
        onTap: onPressed,
        child: child,
      ),
    );
  }
}
