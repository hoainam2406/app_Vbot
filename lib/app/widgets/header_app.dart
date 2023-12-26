import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/pages/phones/Small_call_page.dart';
import 'package:app_vbot/app/pages/phones/app_dialpad.dart';
import 'package:app_vbot/app/pages/vpm_app_bar.dart';
import 'package:app_vbot/app/widgets/app/signal_app.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/app/widgets/historyCall/select_hotline_call_widget.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const VPMAppBar(),
        const Spacer(),
        SmallCallPage(),
        const SizedBox(
          width: 16,
        ),
        // Container(
        //   height: 50,
        //   width: 500,
        //   alignment: Alignment.center,
        //   padding: const EdgeInsets.fromLTRB(12, 9, 12, 9),
        //   child: SearchBar(
        //     elevation: const MaterialStatePropertyAll<double>(0),
        //     shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        //     side: MaterialStatePropertyAll(
        //       BorderSide(width: .3, color: borderColor),
        //     ),
        //     shape: MaterialStatePropertyAll(
        //       RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(12.0),
        //       ),
        //     ),
        //     leading: const Icon(
        //       CupertinoIcons.search,
        //       size: 20,
        //     ),
        //     hintText: 'Tìm kiếm',
        //   ),
        // ),
        // const SizedBox(
        //   width: 32,
        // ),
        const SelectHotlineCallWidget(),
        const SizedBox(
          width: 16,
        ),
        ButtonVBot(
          child: const Icon(
            Icons.dialpad,
            size: 20,
          ),
          onPressed: () {
            showPageAppDialog(
                child: const SizedBox(
                    width: 700, height: 600, child: AppDialpadPage()),
                context: context);
          },
        ),
        const SizedBox(
          width: 16,
        ),
        const SignalApp(),
      ],
    );
  }
}
