import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/components/overlay.dart';
import 'package:app_vbot/app/pages/home.dart';
import 'package:app_vbot/app/pages/vpm_app_bar.dart';
import 'package:app_vbot/app/pages/windown_button.dart';
import 'package:app_vbot/app/widgets/setting/select_language_widget.dart';
import 'package:app_vbot/constant.dart';
import 'package:app_vbot/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AppService appData = GetIt.instance.get<AppService>();
  bool accountSIP = false;
  bool showPassword = false;
  bool splas = true;
  OverlayEntry? entry;

  @override
  void initState() {
    splas = true;
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        splas = false;
      });
    });
  }

  // hàm showOverlay
  void displayOverlay(
      {required keyOverlay keyOverlay,
      String? title,
      required String content}) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        showOverlay(keyOverlay: keyOverlay, title: title, content: content));
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  void showOverlay(
      {required keyOverlay keyOverlay,
      String? title,
      required String content}) {
    entry = OverlayEntry(
      builder: (context) => OverlayBanner(
        title: title,
        content: content,
        keyOver: keyOverlay,
        onBannerDismissed: () {
          hideOverlay();
        },
      ),
    );

    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }
  //

  void login() {
    setState(() {
      splas = true;
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        // Navigator.of(context).pushAndRemoveUntil(
        //   MaterialPageRoute(
        //     builder: (_) => const HomePage(),
        //   ),
        //   (route) => false,
        // );
        // appData.setIsLogout(true);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          ModalRoute.withName("/"),
        );
        // Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        // // backgroundColor: Colors.green,
        titleSpacing: 0,
        // elevation: 0,
        // bottomOpacity: 0,
        // leadingWidth: 0,
        // scrolledUnderElevation: 0,
        toolbarHeight: 50,

        // flexibleSpace: ,
        // primary: false,
        // backgroundColor: Colors.red,

        title: () {
          return const DragToMoveArea(
            child: VPMAppBar(),
          );
        }(),
        // shape: BeveledRectangleBorder(
        //   side: BorderSide(
        //     width: .3,
        //     color: borderColor,
        //   ),
        // ),
        actions: const [
          // Container(
          //   height: 50,
          //   width: 500,
          //   padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
          //   child: const SearchBar(
          //     elevation: MaterialStatePropertyAll<double>(0),
          //     shadowColor: MaterialStatePropertyAll(Colors.transparent),
          //     side: MaterialStatePropertyAll(
          //       BorderSide(width: .3),
          //     ),
          //     leading: Icon(
          //       CupertinoIcons.search,
          //       size: 20,
          //     ),
          //     hintText: 'Tìm kiếm',
          //   ),
          // ),
          // const SizedBox(
          //   width: 32,
          // ),
          // const SelectHotlineCallWidget(),
          // const SizedBox(
          //   width: 16,
          // ),
          // ButtonVBot(
          //   child: const Icon(
          //     Icons.dialpad,
          //     size: 20,
          //   ),
          //   onPressed: () {},
          // ),
          // const SizedBox(
          //   width: 16,
          // ),
          // Container(
          //   width: 20,
          //   height: 20,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(
          //         10,
          //       ),
          //       color: Colors.green),
          // ),
          // const SizedBox(
          //   width: 16,
          // ),
          WindownButtons()
        ],
        // title: Container(
        //   width: double.infinity,
        //   height: 30,
        //   color: Colors.red,
        // ),
      ),
      body: splas
          ? Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/image/logo_vi_dev.png'),
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.green.shade500,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        decoration: null,
                      ),
                      child: const Text('Help you succeed!'),
                    ),
                    // Text(
                    //   'Help you succeed!',
                    //   style: TextStyle(
                    //     fontStyle: FontStyle.italic,
                    //     color: Colors.green.shade500,
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w500,
                    //     decoration: null,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      // height: 8,
                      width: 300,
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      VPMOutlinedButtonAdd2(
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          // displayOverlay(keyOverlay.app_error);
                          displayOverlay(
                            keyOverlay: keyOverlay.app_error,
                            content:
                                'Góc tìm sân cố định Góc tìm sân cố định Góc tìm sân cố định Góc tìm sân cố định',
                          );
                        },
                      ),
                      VPMOutlinedButtonAdd2(
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          displayOverlay(
                            keyOverlay: keyOverlay.app_success,
                            content: 'Góc tìm sân cố định',
                          );
                        },
                      ),
                      VPMOutlinedButtonAdd2(
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          displayOverlay(
                            keyOverlay: keyOverlay.app_warning,
                            title: 'ákld',
                            content: 'Góc tìm sân cố định',
                          );
                        },
                      ),
                    ],
                  ),
                  Center(
                    child: CardVbot(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
                        width: 400,
                        height: 450,
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/image/logo_vi_dev.png'),
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Help you succeed!',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.green.shade500,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Email/VBot ID/Tài khoản SIP',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const SizedBox(
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: .3,
                                          color: Color(0xFFABABAB),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                const Text(
                                  'Mật khẩu',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: TextField(
                                    obscureText: showPassword ? false : true,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(8, 0, 8, 0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: .3,
                                          color: Color(0xFFABABAB),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      activeColor: Colors.green.shade500,
                                      side: const BorderSide(width: .5),
                                      value: accountSIP,
                                      onChanged: (value) {
                                        setState(() {
                                          accountSIP = value!;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Tài khoản SIP',
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      activeColor: Colors.green.shade500,
                                      side: const BorderSide(width: .5),
                                      value: showPassword,
                                      onChanged: (value) {
                                        setState(() {
                                          showPassword = value!;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Hiện mật khẩu',
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                VPMOutlinedButtonAdd2(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    child: const Text(
                                      'Đăng nhập',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    // displayOverlay();
                                    // context.go('/historyCall');

                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => const HomePage()),
                                    // );

                                    login();

                                    // Navigator.pushAndRemoveUntil(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const HomePage()),
                                    //     (Route<dynamic> route) => false);
                                  },
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: const SelectLanguageWidget(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
