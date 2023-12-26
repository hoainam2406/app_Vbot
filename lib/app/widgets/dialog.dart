import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/pages/login/login_page.dart';
import 'package:app_vbot/constant.dart';
import 'package:app_vbot/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void showAppDialog({
  required Widget child,
  VoidCallback? onDialogDismiss,
  required BuildContext context,
}) async {
  await showDialog(
    barrierColor: const Color.fromRGBO(78, 78, 78, 0.3),
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SizedBox(width: 450, height: 800, child: child),
    ),
  );
}

void showPageAppDialog({
  required Widget child,
  VoidCallback? onDialogDismiss,
  required BuildContext context,
}) async {
  await showDialog(
    barrierColor: const Color.fromRGBO(78, 78, 78, 0.3),
    context: context,
    builder: (context) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: child),
  );
}

void showCallAppDialog({
  required Widget child,
  VoidCallback? onDialogDismiss,
  required BuildContext context,
}) async {
  await showDialog(
    barrierColor: Colors.transparent,
    // barrierDismissible: false,
    context: context,
    builder: (context) => Dialog(
      // backgroundColor: Colors.transparent,
      // shadowColor: Colors.red,
      insetPadding: const EdgeInsets.all(16),
      alignment: Alignment.bottomRight,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kElevationToShadow[1],
            borderRadius: BorderRadius.circular(12)),
        width: 300,
        height: 350,

        // width: 420,
        // height: 500,
        child: child,
      ),
    ),
    // Dialog(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(12.0),
    //   ),
    //   child: Center(
    //       child: Stack(
    //     children: [
    //       Positioned(
    //           right: 0,
    //           bottom: 10,
    //           width: 420,
    //           height: 500,
    //           child: SizedBox(width: 420, height: 500, child: child)),
    //     ],
    //   )),
    // ),
  );
  onDialogDismiss?.call();
}

void deleteDialog(
    {VoidCallback? onDialogDismiss,
    required BuildContext context,
    required String description}) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 160, maxWidth: 300),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Text(
                'Thông báo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                description,
                textAlign: TextAlign.left,
              ),
            ),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VPMOutlinedButtonDelete2(
                    child: const Text(
                      'Xóa',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  VPMOutlinedButton(
                    child: const Text(
                      'Hủy',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void logoutDialog(
    {VoidCallback? onDialogDismiss,
    required VoidCallback onPressed,
    required BuildContext context,
    required String content}) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 160, maxWidth: 300),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Text(
                'Đăng xuất',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                content,
                textAlign: TextAlign.left,
              ),
            ),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: VPMOutlinedButtonDelete2(
                      child: const Text(
                        'Đồng ý',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        onPressed.call();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const Login()),
                        // );
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //     builder: (_) => const Login(),
                        //   ),
                        // );
                        // context.go('/historyCall');
                        // context.go('/historyCall');

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                          (Route<dynamic> route) => false,
                        );
                        // context.go('/login');
                        GetIt.instance.get<AppService>().setIsLogout(true);
                        // goRouter.configuration.routes[0].routes[0];
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: VPMOutlinedButton(
                      child: const Text(
                        'Hủy',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void addDialog(
    {VoidCallback? onDialogDismiss,
    required BuildContext context,
    required String content}) async {
  await showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          width: .3,
          color: borderColor,
        ),
      ),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 150,
          maxHeight: 180,
          maxWidth: 300,
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Text(
                'Thông báo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Text(
                content,
                textAlign: TextAlign.left,
              ),
            ),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VPMOutlinedButtonAdd2(
                    child: const Text(
                      'Xác nhận',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  VPMOutlinedButtonDelete2(
                    child: const Text(
                      'Hủy',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
