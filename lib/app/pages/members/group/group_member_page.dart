import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/pages/members/group/group_member_detail_page.dart';
import 'package:app_vbot/app/pages/members/member/add_memberSIP_page.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupMemberPage extends StatefulWidget {
  const GroupMemberPage({super.key});

  @override
  State<GroupMemberPage> createState() => _GroupMemberPageState();
}

class _GroupMemberPageState extends State<GroupMemberPage> {
  // var scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildInfoGroupMember() {
    return VPMOutlinedButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        showAppDialog(
            child: const GroupMemeberDetailPage(content: ''), context: context);
      },
      child: CardVPM(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
              alignment: Alignment.center,
              child: const Text(
                'HN',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Text(
                'Hoài Nam',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Text(
                'Số máy lẻ: 1234',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
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
      //             'Thêm nhóm thành viên',
      //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(CupertinoIcons.clock),
      //         title: const Text('Thêm nhóm thành viên'),
      //         onTap: () {
      //           showAppDialog(child: const AddMemberSIP(), context: context);
      //         },
      //       ),
      //       const Divider(),
      //     ],
      //   ),
      // ),

      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Nhóm thành viên',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          // VPMIconButton(
          //   icon: const Icon(
          //     CupertinoIcons.refresh,
          //     size: 20,
          //   ),
          //   onPressed: () {},
          // ),
          const BoxLoading(),
          const SizedBox(
            width: 12,
          ),
          Tooltip(
              message: 'Làm mới', child: ButtonRefreshVBot(onPressed: () {})),
          const SizedBox(
            width: 12,
          ),
          Tooltip(
            message: 'Thêm khách hàng',
            child: ButtonAddVBot(
              onPressed: () {
                showAppDialog(child: const AddMemberSIP(), context: context);
              },
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          // IconButton(
          //   icon: const Icon(
          //     CupertinoIcons.bars,
          //     size: 30,
          //   ),
          //   onPressed: () {
          //     scaffoldKey.currentState?.openEndDrawer();
          //   },
          //   tooltip: 'Menu',
          // ),
        ],
      ),
      body: Column(
        children: [
          // const LinearProgressIndicator(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 12),
              child: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(right: 12),
                  child: Wrap(
                    runSpacing: 16,
                    spacing: 16,
                    children: [
                      for (int i = 0; i < 21; i++) _buildInfoGroupMember(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
