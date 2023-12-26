import 'package:app_vbot/app/widgets/base/base.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VPMAppBar extends StatefulWidget {
  const VPMAppBar({super.key});

  @override
  State<VPMAppBar> createState() => _VPMAppBarState();
}

class _VPMAppBarState extends State<VPMAppBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        // color: Colors.red,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        height: 50,
        child: Row(children: [
          const Image(
            image: AssetImage('assets/image/logo_vi_dev.png'),
            width: 28,
            height: 28,
          ),
          const HMinSpace(),
          const Text(
            appName,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.fromLTRB(4, 1, 4, 1),
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(width: 1, color: Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(6))),
            child: const Text(
              'Beta',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          )
        ]),
      ),
    );
  }
}
