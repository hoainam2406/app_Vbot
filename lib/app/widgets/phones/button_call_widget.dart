import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/pages/phones/setting_call_page.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/service/app_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class ButtonCall extends StatefulWidget with GetItStatefulWidgetMixin {
  ButtonCall({super.key});

  @override
  State<ButtonCall> createState() => _ButtonCallState();
}

class _ButtonCallState extends State<ButtonCall>
    with SingleTickerProviderStateMixin, GetItStateMixin {
  AppService appData = GetIt.instance.get<AppService>();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // bool answer = false;
  bool micro = false;
  bool speaker = false;

  @override
  Widget build(BuildContext context) {
    var answer = watchOnly((AppService x) => x.answer);
    return Column(
      children: [
        if (answer)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VPMIconButton(
                icon: Icon(
                  micro == false ? Icons.mic_off_rounded : Icons.mic,
                  size: 25,
                ),
                onPressed: () {
                  setState(() {
                    micro = !micro;
                  });
                },
              ),
              const SizedBox(
                width: 12,
              ),
              VPMIconButton(
                icon: const Icon(
                  Icons.settings,
                  size: 25,
                ),
                onPressed: () {
                  showCallAppDialog(
                      onDialogDismiss: () {
                        // appData.setShowSmallCall(true);
                      },
                      child: const SettingCallPage(),
                      context: context);
                },
              ),
            ],
          ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: Colors.black,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              padding: const EdgeInsets.all(14),
              icon: const Icon(
                CupertinoIcons.phone_down_fill,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
                appData.setAnswerCall(false);
                appData.setShowSmallCall(false);
                // appData.setEndCall(true);
              },
            ),
            if (!answer) ...[
              const SizedBox(
                width: 36,
              ),
              AnimatedBuilder(
                animation: _animation,
                child: IconButton(
                  color: Colors.black,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  ),
                  padding: const EdgeInsets.all(14),
                  icon: const Icon(
                    CupertinoIcons.phone_fill,
                    size: 20,
                  ),
                  onPressed: () {
                    // setState(() {
                    //   answer = true;
                    // });
                    appData.setAnswerCall(true);
                  },
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 0.1 * 8,
                    child: child,
                  );
                },
              )
              // Transform.rotate(
              //   angle: _controller.value * 2 * 360,
              //   child: IconButton(
              //     color: Colors.black,
              //     style: const ButtonStyle(
              //       backgroundColor: MaterialStatePropertyAll(Colors.green),
              //     ),
              //     padding: const EdgeInsets.all(14),
              //     icon: const Icon(
              //       CupertinoIcons.phone_fill,
              //       size: 20,
              //     ),
              //     onPressed: () {
              //       // setState(() {
              //       //   answer = true;
              //       // });
              //       appData.setAnswerCall(true);
              //     },
              //   ),
              // )
            ],
          ],
        ),
      ],
    );
  }
}
