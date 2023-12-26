import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/widgets/phones/button_call_widget.dart';
import 'package:app_vbot/service/app_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NotiCallPage extends StatefulWidget {
  const NotiCallPage({super.key});

  @override
  State<NotiCallPage> createState() => _NotiCallPageState();
}

class _NotiCallPageState extends State<NotiCallPage> {
  AppService appData = GetIt.instance.get<AppService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(155, 246, 246, 246)),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        children: [
          Row(
            children: [
              const Image(
                image: AssetImage('assets/image/logo_vi_dev.png'),
                width: 25,
                height: 25,
              ),
              const SizedBox(
                width: 12,
              ),
              const Text(
                'VBot Call',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              VPMIconButton(
                icon: const Icon(
                  CupertinoIcons.minus,
                ),
                onPressed: () {
                  // appData.setShowSmallCall(true);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(65)),
            child: const Image(
              image: AssetImage('assets/image/avatar.jpg'),
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Tooltip(
            message: '1111',
            child: Text(
              'Hoàng Võ Hoài Nam',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // const SizedBox(
          //   height: 12,
          // ),
          const Text(
            '00:00',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          ButtonCall(),
          // const SizedBox(
          //   height: 12,
          // ),
        ],
      ),
    );
  }
}
