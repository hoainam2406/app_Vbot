import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/pages/members/member/add_memberSIP_page.dart';
import 'package:app_vbot/app/pages/members/member/add_member_with_search_page.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/app/widgets/members/header_members_widget.dart';
import 'package:app_vbot/app/widgets/members/info_member_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListMemberPage extends StatefulWidget {
  const ListMemberPage({super.key});

  @override
  State<ListMemberPage> createState() => _ListMemberPageState();
}

class _ListMemberPageState extends State<ListMemberPage> {
  // var scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildInvitationSent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'Lời mời đã gửi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        for (int i = 0; i < 5; i++)
          Container(
            // width: 350,
            // height: 90,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: .3),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'HN1111',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hoàng Võ Hoài Nam ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Vbot ID: ',
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: 'hoainam123',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      VPMOutlinedButtonDelete(
                        padding: const EdgeInsets.all(8),
                        text: 'Hủy lời mời',
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }

  Widget _buildJoinGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'Yêu cầu tham gia nhóm',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        for (int i = 0; i < 5; i++)
          Container(
            // width: 350,
            // height: 90,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: .3),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25),
                  ),
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
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hoàng Võ Hoài Nam ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Vbot ID: ',
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: 'hoainam123',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          VPMOutlinedButtonAdd(
                            padding: const EdgeInsets.all(8),
                            text: 'Chấp nhận',
                            onPressed: () {},
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          VPMOutlinedButtonDelete(
                            padding: const EdgeInsets.all(8),
                            text: 'Từ chối',
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
      ],
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
      //         leading: const Icon(CupertinoIcons.device_phone_portrait),
      //         title: const Text('Thêm tài khoản thiết bị'),
      //         onTap: () {
      //           showAppDialog(child: const AddMemberSIP(), context: context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(CupertinoIcons.person_add),
      //         title: const Text('Thêm thành viên'),
      //         onTap: () {
      //           showAppDialog(
      //               child: const AddMemberWithSearchPage(), context: context);
      //         },
      //       ),
      //       const Divider(),
      //       Expanded(
      //         child: ListView(
      //           children: [
      //             _buildInvitationSent(),
      //             const SizedBox(
      //               height: 12,
      //             ),
      //             _buildJoinGroup()
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Danh sách thành viên',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          const BoxLoading(),
          const SizedBox(
            width: 12,
          ),
          Tooltip(
            message: 'Làm mới',
            child: SizedBox(
              width: 32,
              height: 32,
              child: VPMOutlinedButton(
                onPressed: () {},
                padding: const EdgeInsets.all(0),
                child: const Icon(
                  Icons.refresh,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          )
          // Container(
          //   height: double.maxFinite,
          //   alignment: Alignment.center,
          //   child: Stack(
          //     children: [
          //       IconButton(
          //         icon: const Icon(
          //           CupertinoIcons.bars,
          //           size: 30,
          //         ),
          //         onPressed: () {
          //           scaffoldKey.currentState?.openEndDrawer();
          //         },
          //         tooltip: 'Menu',
          //       ),
          //       Container(
          //         width: 20,
          //         height: 20,
          //         alignment: Alignment.center,
          //         decoration: BoxDecoration(
          //           color: Colors.red,
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //         child: const Text(
          //           '1',
          //           style: TextStyle(color: Colors.white, fontSize: 12),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: .3),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                child: Row(
                  children: [
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
                            child: const AddMemberSIP(), context: context);
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
                            CupertinoIcons.person_add,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Thêm thành viên',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      onPressed: () {
                        showAppDialog(
                            child: const AddMemberWithSearchPage(),
                            context: context);
                      },
                    ),
                  ],
                ),
              ),
              const HeaderMembers(),
              Expanded(
                child: SingleChildScrollView(
                  // padding: const EdgeInsets.only(right: 12),
                  child: Wrap(
                    runSpacing: 0,
                    children: [
                      for (int i = 0; i < 10; i++) ...[
                        VPMTextButton(
                          style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(0),
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            context.go('/feature/members/detail/member');
                          },
                          child: InfoMemberWidget(
                            admin: i == 0 ? true : false,
                            length: i == 0 ? 3 : 1,
                          ),
                        ),
                      ],
                      for (int i = 0; i < 10; i++) ...[
                        VPMTextButton(
                          style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(0),
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            context.go('/feature/members/detail/SIP');
                          },
                          child: const InfoMemberWidget(
                            admin: false,
                            length: 1,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
          // const LinearProgressIndicator(),
        ],
      ),
    );
  }
}
