import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/pages/phones/noti_call_page.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/service/app_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class SmallCallPage extends StatefulWidget with GetItStatefulWidgetMixin {
  SmallCallPage({super.key});

  @override
  State<SmallCallPage> createState() => _SmallCallPageState();
}

class _SmallCallPageState extends State<SmallCallPage> with GetItStateMixin {
  AppService appData = GetIt.instance.get<AppService>();
  @override
  Widget build(BuildContext context) {
    var showSmallCall = watchOnly((AppService x) => x.showSmallCall);
    if (showSmallCall) {
      return VPMOutlinedButton(
        onPressed: () {
          showCallAppDialog(
            child: const NotiCallPage(),
            context: context,
            onDialogDismiss: () {
              // appData.setShowSmallCall(true);
              // if (endCall == false) {
              //   appData.setShowSmallCall(true);
              //   // appData.setEndCall(true);
              //   print('nam log 1');
              // } else {
              //   appData.setShowSmallCall(false);
              //   appData.setEndCall(false);
              //   print('nam log 2');
              // }
            },
          );
        },
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: const Image(
                image: AssetImage('assets/image/avatar.jpg'),
                fit: BoxFit.cover,
                width: 25,
                height: 25,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              '00:00',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
