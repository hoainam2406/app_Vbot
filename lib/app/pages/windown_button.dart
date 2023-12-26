import 'package:flutter/cupertino.dart';
import 'package:window_manager/window_manager.dart';

class WindownButtons extends StatelessWidget {
  const WindownButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      // width: 138,
      width: 140,
      height: 50,
      child: WindowCaption(),
    );
  }
}

class WindowCaption extends StatefulWidget {
  const WindowCaption({super.key});

  @override
  State<WindowCaption> createState() => _WindownCaptionState();
}

class _WindownCaptionState extends State<WindowCaption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: widget.backgroundColor ??
      //       (widget.brightness == Brightness.dark
      //           ? const Color(0xff1C1C1C)
      //           : Colors.transparent),
      // ),
      child: Row(
        children: [
          Expanded(
            child: DragToMoveArea(
              child: SizedBox(
                height: double.infinity,
                child: Row(
                  children: [
                    DefaultTextStyle(
                      style: const TextStyle(
                        // color: widget.brightness == Brightness.light
                        //     ? Colors.black.withOpacity(0.8956)
                        //     : Colors.white,
                        fontSize: 14,
                      ),
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          WindowCaptionButton.minimize(
            onPressed: () async {
              bool isMinimized = await windowManager.isMinimized();
              if (isMinimized) {
                windowManager.restore();
              } else {
                windowManager.minimize();
              }
            },
          ),
          FutureBuilder<bool>(
            future: windowManager.isMaximized(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data == true) {
                return WindowCaptionButton.unmaximize(
                  onPressed: () {
                    windowManager.unmaximize();
                    setState(() {});
                  },
                );
              }
              return WindowCaptionButton.maximize(
                onPressed: () {
                  windowManager.maximize();
                  setState(() {});
                },
              );
            },
          ),
          WindowCaptionButton.close(
            onPressed: () {
              windowManager.close();
            },
          ),
        ],
      ),
    );
  }

  @override
  void onWindowMaximize() {
    setState(() {});
  }

  @override
  void onWindowUnmaximize() {
    setState(() {});
  }
}
