import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({
    super.key,
    this.title,
    required this.subTitle,
    this.icon,
    this.checked,
    required this.number,
    this.tintColor,
    this.backgroundColor,
    this.onPressed,
    // this.onLongPress,
  });
  final String? title;
  final String subTitle;
  final IconData? icon;
  final bool? checked;
  final bool number;
  final Color? tintColor;
  final Color? backgroundColor;
  final Function()? onPressed;
  // final Function()? onLongPress;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 60,
          width: 100,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(4.0),
          //   color: widget.backgroundColor ??
          //       (theme.brightness == Brightness.dark
          //           ? Colors.grey[150]
          //           : Colors.grey[20]),
          // ),
          child: IconButton(
              icon: Padding(
                padding: const EdgeInsets.all(0.0),
                child: widget.number
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${widget.title}',
                            // style: theme.typography.subtitle,
                          ),
                          Text(
                            widget.subTitle.toUpperCase(),
                            // style: theme.typography.caption,
                          ),
                        ],
                      )
                    : Icon(
                        widget.icon,
                        size: 24.0,
                        // color: widget.tintColor ??
                        //     (theme.brightness == Brightness.dark
                        //         ? Colors.white
                        //         : Colors.black),
                      ),
              ),
              // onLongPress: widget.onLongPress,

              onPressed: widget.onPressed),
        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0))
      ],
    );
  }
}
