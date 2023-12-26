import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/pages/members/member/add_hotline_manage_page.dart';
import 'package:app_vbot/app/pages/members/member/extension_number_page.dart';
import 'package:app_vbot/app/pages/members/member/group_account_page.dart';
import 'package:app_vbot/app/pages/members/member/select_memberSIP_page.dart';

import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/app/widgets/members/hotline_manage_widget.dart';
import 'package:app_vbot/app/widgets/members/limit_time_call_widget.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MemberDetailPage extends StatefulWidget {
  const MemberDetailPage({super.key, required this.content});
  final String content;

  @override
  State<MemberDetailPage> createState() => _MemberDetailPageState();
}

class _MemberDetailPageState extends State<MemberDetailPage> {
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  String get content => widget.content;
  bool checked2 = false;
  Widget _buildInfoMember() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(30)),
          alignment: Alignment.center,
          child: const Text(
            'HN',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Hoài Nam',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        // const SizedBox(
        //   height: 12,
        // ),
        const Text(
          'VBot ID: nam123',
          // style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildInfoMember2() {
    return CardVPM(
      child: Row(
        children: [
          // Container(
          //   width: 60,
          //   height: 60,
          //   decoration: BoxDecoration(
          //       color: Colors.green, borderRadius: BorderRadius.circular(12)),
          //   alignment: Alignment.center,
          //   child: const Text(
          //     'HN',
          //     style: TextStyle(
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white70),
          //   ),
          // ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: const Image(
              image: AssetImage('assets/image/avatar.jpg'),
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoài Nam',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'VBot ID: nam123',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccount() {
    return CardVPM(
      child: Column(
        children: [
          const SizedBox(
            width: double.maxFinite,
            child: Text(
              'Tài khoản',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          VPMOutlinedButton(
            child: const SizedBox(
              width: double.maxFinite,
              child: Text(
                '6000 đ',
                style: TextStyle(color: Colors.black),
              ),
            ),
            onPressed: () {
              showAppDialog(child: const GroupAccountPage(), context: context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLimitTimeCall() {
    return const CardVPM(child: LimitTimeCallWidget());
  }

  Widget _buildExtensionNumber() {
    return CardVPM(
      child: Column(
        children: [
          const SizedBox(
            width: double.maxFinite,
            child: Text(
              'Số máy lẻ',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          VPMOutlinedButton(
            child: const SizedBox(
              width: double.maxFinite,
              child: Text(
                '1000',
                style: TextStyle(color: Colors.black),
              ),
            ),
            onPressed: () {
              showAppDialog(
                  child: const ExtensionNumberPage(), context: context);
            },
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            'Thành viên được gắn số máy lẻ này sẽ nhận được cuộc gọi khi khách hàng bấm số máy lẻ trên bàm phím điện thoại hoặc nhận được chuyển tiếp các cuộc gọi khi các thành viên khác chuyển sang',
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget _buildHotlineManage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: CardVPM(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 8),
              child: Text(
                'Hotline quản lý',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(
              height: 1,
            ),
            // for (int i = 0; i < 3; i++) HotlineManageWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  // runSpacing: 0,
                  // spacing: 0,
                  children: [
                    for (int i = 0; i < 3; i++) const HotlineManageWidget2()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHotlineManage2() {
    return CardVPM(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 8),
            child: Text(
              'Hotline quản lý',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          // const Divider(
          //   height: 1,
          // ),
          for (int i = 0; i < 1; i++) const HotlineManageWidget2()
        ],
      ),
    );
  }

  Widget _buildAccountSIP() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: CardVPM(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 8),
              child: Text(
                'Tài khoản thiết bị',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 0,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: .3),
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
                        child: SizedBox(
                          width: double.infinity / 2,
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center,
                                child: const Text(
                                  'HN',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Text(
                                'Tài khoản thiết bị',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOnOffMemberSIP() {
    return CardVPM(
      child: Row(
        children: [
          const Text(
            'Bật/tắt tài khoản thiết bị',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          SizedBox(
            width: 40,
            child: Transform.scale(
              scale: .7,
              child: Switch(
                activeColor: Colors.green.shade500,
                value: checked2,
                onChanged: (bool value) {
                  setState(() {
                    checked2 = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDomain() {
    return CardVPM(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Domain',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              const Text(
                '123.30.238.5:6000',
              ),
              const SizedBox(
                width: 12,
              ),
              TextButton(
                style: const ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                child: const Text('Sao chép'),
                onPressed: () {
                  Clipboard.setData(
                    const ClipboardData(
                      text: '123.30.238.5:6000',
                    ),
                  );
                  const snackBar = SnackBar(
                    content: Text('Sao chép domain thành công'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              )
            ],
          ),
          const Divider(),
          const Text(
            'Nhập thông tin này vào softphone hoặc iphone để đăng nhập vào hệ thống',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      // endDrawer: Drawer(
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
      //   ),
      //   width: 350,
      //   child: Column(
      //     children: [
      //       const SizedBox(
      //         height: 65,
      //         width: 350,
      //         child: DrawerHeader(
      //           child: Text(
      //             'Danh sách thành viên',
      //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(CupertinoIcons.phone_badge_plus),
      //         title: const Text('Thêm hotline quản lý'),
      //         onTap: () {
      //           showAppDialog(
      //               child: const AddHotlineManagePage(), context: context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(CupertinoIcons.phone_badge_plus),
      //         title: const Text('Thêm tài khoản thiết bị'),
      //         onTap: () {
      //           showAppDialog(
      //               child: const SelectMemberSIPPage(), context: context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),

      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Chi tiết thành viên',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          const BoxLoading(),
          const SizedBox(
            width: 12,
          ),
          ButtonRefreshVBot(onPressed: () {}),
          // Container(
          //   height: double.maxFinite,
          //   alignment: Alignment.center,
          //   child: IconButton(
          //     icon: const Icon(
          //       CupertinoIcons.bars,
          //       size: 30,
          //     ),
          //     onPressed: () {
          //       scaffoldKey.currentState?.openEndDrawer();
          //     },
          //     tooltip: 'Menu',
          //   ),
          // ),
          const SizedBox(
            width: 12,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // decoration: const BoxDecoration(
            //   border: Border(
            //     bottom: BorderSide(width: .3),
            //   ),
            // ),
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Row(
              children: [
                VPMOutlinedButton(
                  padding: const EdgeInsets.all(8),
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.phone_fill,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Thêm hotline',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  onPressed: () {
                    showAppDialog(
                        child: const AddHotlineManagePage(), context: context);
                  },
                ),
                const SizedBox(
                  width: 12,
                ),
                VPMOutlinedButton(
                  padding: const EdgeInsets.all(8),
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.device_phone_portrait,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Thêm tài khoản thiết bị',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  onPressed: () {
                    showAppDialog(
                      child: const SelectMemberSIPPage(),
                      context: context,
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: content != 'SIP'
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                            child: Column(
                              // alignment: WrapAlignment.start,
                              // runSpacing: 12,
                              children: [
                                _buildInfoMember2(),
                                const SizedBox(
                                  height: 12,
                                ),
                                _buildAccount(),
                                const SizedBox(
                                  height: 12,
                                ),
                                // Expanded(child: _buildAccountSIP()),
                                Expanded(child: _buildHotlineManage()),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLimitTimeCall(),
                                const SizedBox(
                                  height: 12,
                                ),
                                _buildExtensionNumber(),
                                const SizedBox(
                                  height: 12,
                                ),
                                // Expanded(child: _buildHotlineManage()),
                                Expanded(child: _buildAccountSIP()),
                                const SizedBox(
                                  height: 12,
                                ),
                                VPMOutlinedButtonDelete2(
                                  child: const SizedBox(
                                    width: double.maxFinite,
                                    child: Text(
                                      'Xóa thành viên',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  onPressed: () {
                                    deleteDialog(
                                      context: context,
                                      description: 'content',
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                            child: Column(
                              // alignment: WrapAlignment.start,
                              // runSpacing: 12,
                              children: [
                                _buildInfoMember2(),
                                const SizedBox(
                                  height: 12,
                                ),
                                _buildAccount(),
                                const SizedBox(
                                  height: 12,
                                ),
                                _buildLimitTimeCall(),
                                const SizedBox(
                                  height: 12,
                                ),
                                _buildExtensionNumber(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildOnOffMemberSIP(),
                                const SizedBox(
                                  height: 12,
                                ),
                                // _buildDomain(),
                                // const SizedBox(
                                //   height: 12,
                                // ),
                                _buildHotlineManage2(),
                                const SizedBox(
                                  height: 12,
                                ),
                                VPMOutlinedButtonDelete2(
                                  child: const SizedBox(
                                    width: double.maxFinite,
                                    child: Text(
                                      'Xóa thành viên',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  onPressed: () {
                                    deleteDialog(
                                      context: context,
                                      description: 'content',
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
