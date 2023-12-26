import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayBanner extends StatefulWidget {
  const OverlayBanner(
      {Key? key,
      this.onBannerDismissed,
      required this.keyOver,
      this.title,
      required this.content})
      : super(key: key);

  final VoidCallback? onBannerDismissed;
  final keyOverlay keyOver;
  final String? title;
  final String content;

  @override
  State<OverlayBanner> createState() => _OverlayBannerState();
}

class _OverlayBannerState extends State<OverlayBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const Curve curve = Curves.easeOut;

  keyOverlay get keyOver => widget.keyOver;
  String get title => widget.title ?? '';
  String get content => widget.content;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _playAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 0,
      child: AnimatedBuilder(
        builder: (context, child) {
          final double animationValue = curve.transform(_controller.value);
          return FractionalTranslation(
            translation: Offset((1 - animationValue), 0),
            child: child,
          );
        },
        animation: _controller,
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(12),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: keyOver == keyOverlay.app_warning
                ? const Color.fromRGBO(255, 244, 206, 1)
                : keyOver == keyOverlay.app_error
                    ? const Color.fromRGBO(253, 231, 233, 1)
                    : const Color.fromRGBO(223, 246, 221, 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                keyOver == keyOverlay.app_warning
                    ? Icons.error
                    : keyOver == keyOverlay.app_error
                        ? CupertinoIcons.clear_circled_solid
                        : Icons.check_circle,
                size: 30,
                color: keyOver == keyOverlay.app_warning
                    ? const Color.fromRGBO(157, 93, 0, 1)
                    : keyOver == keyOverlay.app_error
                        ? const Color.fromRGBO(196, 43, 28, 1)
                        : const Color.fromRGBO(15, 123, 15, 1),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    child: Text(
                      title != '' ? title : 'Thông báo',
                    ),
                  ),
                  // Text(
                  //   title != '' ? title : 'Thông báo',
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  Container(
                    constraints:
                        const BoxConstraints(minWidth: 100, maxWidth: 150),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      child: Text(content),
                    ),

                    // Text(
                    //   content,
                    //   style: const TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.normal,
                    //     color: Colors.black,
                    //   ),
                    // ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() async {
    // fist will show banner with forward.
    await _controller.forward();
    // wait for 3 second and then play reverse animation to hide the banner
    // Duration can be passed as parameter, banner will wait this much and then will dismiss
    await Future<void>.delayed(const Duration(seconds: 5));
    await _controller.reverse(from: 1);
    // call onDismissedCallback so OverlayWidget can remove and clear the OverlayEntry.
  }
}

// // hàm showOverlay
// void displayOverlay() {
//   WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay());
// }

// void hideOverlay() {
//   entry?.remove();
//   entry = null;
// }

// void showOverlay() {
//   entry = OverlayEntry(
//     builder: (context) => OverlayBanner(
//       onBannerDismissed: () {
//         hideOverlay();
//       },
//     ),
//   );

//   final overlay = Overlay.of(context);
//   overlay.insert(entry!);
// }
//   //
