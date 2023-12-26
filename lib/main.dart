import 'dart:ui';

import 'package:app_vbot/app/pages/historycall/history_call_page.dart';
import 'package:app_vbot/app/pages/login/login_page.dart';
import 'package:app_vbot/routes/router.dart';
import 'package:app_vbot/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() {
  setup();
  runApp(const MyApp());
  //

  // await flutter_acrylic.Window.initialize();
  WindowManager.instance.ensureInitialized();
  // Lấy FlutterView
  FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
  // Kích thước tính bằng pixel
  Size size = view.physicalSize;
  // Lấy chiều rộng màn hình
  double width = size.width;
  // Lấy chiều cao màn hình
  double height = size.height;

  WindowManager.instance.setMinimumSize(
      Size(width < 1180 ? width : 1180, height < 788 ? height : 788));

  windowManager.waitUntilReadyToShow().then(
    (_) async {
      await windowManager.setTitleBarStyle(
        TitleBarStyle.hidden,
        windowButtonVisibility: false,
      );
      await windowManager.setMaximizable(true);
      await windowManager.setResizable(true);
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
      await windowManager.setMinimizable(true);
      // await windowManager.center();
      await windowManager.show();
      await windowManager.focus();
      await windowManager.getTitle();
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
    // return MaterialApp.router(
    //   routerConfig: goRouter,
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(primarySwatch: Colors.indigo),
    // );
  }
}
