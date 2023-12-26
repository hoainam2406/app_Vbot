import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/app/widgets/permission/add_group_permission_widget.dart';
import 'package:app_vbot/app/widgets/permission/info_member_widget.dart';
import 'package:app_vbot/app/widgets/permission/update_group_permission_widget.dart';
import 'package:app_vbot/app/widgets/simple_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _buildInfoGroup() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(),
        ),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                Text(
                  'Tên nhóm',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Thành viên áp dụng',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Wrap(
                  spacing: 4,
                  children: [
                    for (int i = 0; i < 4; i++)
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    // Container(
                    //   clipBehavior: Clip.hardEdge,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(8)),
                    //   child: const Image(
                    //     image: AssetImage('assets/image/avatar.jpg'),
                    //     fit: BoxFit.cover,
                    //     width: 25,
                    //     height: 25,
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNameGroup() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tên nhóm quyền',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8,
        ),
        CardVPM(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nhóm test',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    'Đội em mới thành lập muốn tìm đối đá giao lưu để lấy cảm giác. Hiện tại bên em chưa đặt sân, mong muốn đá loanh quanh khu vực Đống Đa vaò thời điểm 8-10h tối. Đội toàn sinh viên bao hạnh kiểm tốt ạ')
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMember() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Thành viên áp dụng',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        CardVPM(
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Padding(
                //   padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                //   child: Text(
                //     'Thành viên áp dụng',
                //     style: TextStyle(
                //         // fontSize: 20,
                //         fontWeight: FontWeight.w600),
                //     textAlign: TextAlign.left,
                //   ),
                // ),
                // const Divider(),
                Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        for (int i = 0; i < 5; i++) const InfoMemberWidget(),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListRoleSelected() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quyền quản lý',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          runSpacing: 12,
          children: [
            for (int i = 0; i < 5; i++) ...[
              CardVPM(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.arrowtriangle_right_fill,
                            size: 12,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Quản lý thành viên',
                            style: TextStyle(
                                // fontSize: 20,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          for (int i = 0; i < 5; i++)
                            const Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.arrowtriangle_right_fill,
                                    size: 8,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text('Quản lý thành viên'),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      // endDrawer: const Drawer(
      //   width: 500,
      //   child: Placeholder(),
      // ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Phân quyền thành viên',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 16, 8),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: .3))),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: SearchBar(
                            elevation:
                                const MaterialStatePropertyAll<double>(0),
                            shadowColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            side: const MaterialStatePropertyAll(
                              BorderSide(width: .3),
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            leading: const Icon(
                              CupertinoIcons.search,
                              size: 20,
                            ),
                            hintText: 'Tìm kiếm',
                          ),
                        ),
                      ),
                      // VPMIconButton(
                      //   icon: const Icon(
                      //     CupertinoIcons.person_add_solid,
                      //     size: 20,
                      //   ),
                      //   onPressed: () {
                      //     showAppDialog(
                      //         child: const AddGroupPermission(),
                      //         context: context);
                      //   },
                      //   tooltip: 'Thêm nhóm quyền',
                      // ),
                      const SizedBox(
                        width: 12,
                      ),
                      ButtonVBot(
                        onPressed: () {
                          showAppDialog(
                              child: const AddGroupPermission(),
                              context: context);
                        },
                        child: const Icon(
                          CupertinoIcons.person_add_solid,
                          size: 20,
                        ),
                      ),
                      // VPMIconButton(
                      //   icon: const Icon(
                      //     CupertinoIcons.refresh,
                      //     size: 20,
                      //   ),
                      //   onPressed: () {
                      //     context.go('/feature/crm/detail/kjahsda');
                      //   },
                      //   tooltip: 'Làm mới',
                      // ),
                      const SizedBox(
                        width: 12,
                      ),
                      ButtonRefreshVBot(onPressed: () {})
                    ],
                  ),
                ),
                // const LinearProgressIndicator(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: [
                        for (int i = 1; i < 10; i++)
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
                            onPressed: () {},
                            child: VPMSelectionWidget(
                              padding: EdgeInsets.zero,
                              select: i == 5 ? true : false,
                              child: _buildInfoGroup(),
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const VerticalDivider(
            width: 1,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 16, left: 16, bottom: 8),
                  child: Text(
                    'Thông tin nhóm quyền',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16, left: 16, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ButtonRefreshVBot(onPressed: () {}),
                      const SizedBox(
                        width: 12,
                      ),
                      VPMOutlinedButton(
                        // padding: const EdgeInsets.all(8),
                        child: const Row(
                          children: [
                            Icon(Icons.edit_document),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Xem',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        onPressed: () {
                          showAppDialog(
                              child: const UpdateGroupPermission(),
                              context: context);
                        },
                      ),

                      // ButtonVBot(
                      //   width: 70,
                      //   onPressed: () {},
                      //   child: const Row(
                      //     children: [
                      //       Icon(Icons.edit_document),
                      //       SizedBox(
                      //         width: 8,
                      //       ),
                      //       Text(
                      //         'Xem',
                      //         style: TextStyle(color: Colors.black),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        width: 12,
                      ),
                      // VPMOutlinedButtonDelete2(
                      //   child: const Text(
                      //     'Xóa',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   onPressed: () {
                      //     showAppDialog(
                      //         child: const UpdateGroupPermission(),
                      //         context: context);
                      //   },
                      // ),
                      VPMOutlinedButton(
                        // padding: const EdgeInsets.all(8),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Xóa',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        onPressed: () {
                          // showAppDialog(
                          //     child: const UpdateGroupPermission(),
                          //     context: context);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 16, left: 16, bottom: 12),
                      child: Wrap(
                        runSpacing: 12,
                        spacing: 12,
                        children: [
                          _buildNameGroup(),
                          _buildMember(),
                          _buildListRoleSelected(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
