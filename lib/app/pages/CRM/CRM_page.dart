import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/pages/CRM/add_member_page.dart';
import 'package:app_vbot/app/pages/CRM/groups/group_customer_page.dart';
import 'package:app_vbot/app/pages/CRM/otherField/other_field_customer_page.dart';
import 'package:app_vbot/app/pages/CRM/status/status_customer_page.dart';
import 'package:app_vbot/app/pages/CRM/type/type_customer_page.dart';
import 'package:app_vbot/app/widgets/crm/header_crm_widget.dart';
import 'package:app_vbot/app/widgets/crm/info_member_widget.dart';
import 'package:app_vbot/app/widgets/crm/select_group_widget.dart';
import 'package:app_vbot/app/widgets/crm/select_status_widget.dart';
import 'package:app_vbot/app/widgets/crm/select_type_widget.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/app/widgets/historyCall/button_filter_widget.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/crm/Select_hotline_widget.dart';

class CRMPage extends StatefulWidget {
  const CRMPage({super.key});

  @override
  State<CRMPage> createState() => _CRMPageState();
}

class _CRMPageState extends State<CRMPage> with SingleTickerProviderStateMixin {
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textController = TextEditingController(text: '');

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    if (_isExpanded == true) {
      _controller.value = 1;
    }
  }

  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;
  set isExpanded(bool value) {
    if (_isExpanded != value) _handlePressed();
  }

  void _handlePressed() {
    if (_isExpanded) {
      _controller.animateTo(
        0.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceIn,
      );
      _isExpanded = false;
    } else {
      _controller.animateTo(
        1.0,
        duration: const Duration(milliseconds: 200),
      );
      _isExpanded = true;
    }
    PageStorage.of(context).writeState(context, _isExpanded);
    if (mounted) setState(() {});
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
      //             'Quản lý khách hàng',
      //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(CupertinoIcons.add_circled),
      //         title: const Text('Thêm liên hệ khách hàng'),
      //         onTap: () {
      //           showPageAppDialog(
      //               child: const SizedBox(
      //                   width: 800, height: 800, child: AddMemberPage()),
      //               context: context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(CupertinoIcons.bolt_circle),
      //         title: const Text('Trạng thái'),
      //         onTap: () {
      //           showAppDialog(
      //               child: const StatusCustomerPage(), context: context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(CupertinoIcons.person_3),
      //         title: const Text('Nhóm khách hàng'),
      //         onTap: () {
      //           showAppDialog(
      //               child: const GroupCustomerPage(), context: context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(CupertinoIcons.person_2_square_stack),
      //         title: const Text('Kiểu khách hàng'),
      //         onTap: () {
      //           showAppDialog(
      //               child: const TypeCustomerPage(), context: context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(CupertinoIcons.doc_text),
      //         title: const Text('Tùy chỉnh thông tin'),
      //         onTap: () {
      //           showAppDialog(
      //               child: const OtherFieldCustomerPage(), context: context);
      //         },
      //       ),
      //       const Divider(),
      //       const Padding(
      //         padding: EdgeInsets.fromLTRB(12, 0, 12, 8),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text('Tên khách hàng'),
      //             SizedBox(
      //               height: 8,
      //             ),
      //             SizedBox(
      //               height: 40,
      //               child: TextField(
      //                 decoration: InputDecoration(
      //                     // border: OutlineInputBorder(

      //                     // ),
      //                     border: OutlineInputBorder(
      //                       borderRadius: BorderRadius.all(
      //                         Radius.circular(12),
      //                       ),
      //                     ),
      //                     contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0)),
      //               ),
      //             ),
      //             SizedBox(
      //               height: 8,
      //             ),
      //             Text('Trạng thái:'),
      //             SizedBox(
      //               height: 8,
      //             ),
      //             SelectHotlineWidget(),
      //             SizedBox(
      //               height: 8,
      //             ),
      //             Text('Kiểu khách hàng:'),
      //             SizedBox(
      //               height: 8,
      //             ),
      //             SelectHotlineWidget(),
      //             SizedBox(
      //               height: 8,
      //             ),
      //             Text('Nhóm khách hàng:'),
      //             SizedBox(
      //               height: 8,
      //             ),
      //             SelectHotlineWidget(),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),

      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Quản lý khách hàng',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          // VPMIconButton(
          //   tooltip: 'Thêm khách hàng',
          //   icon: const Icon(
          //     CupertinoIcons.add,
          //     size: 20,
          //   ),
          //   onPressed: () {
          //     showPageAppDialog(
          //         child: const SizedBox(
          //             width: 800, height: 800, child: AddMemberPage()),
          //         context: context);
          //   },
          // ),
          // const SizedBox(
          //   width: 12,
          // ),
          // VPMIconButton(
          //   tooltip: 'làm mới',
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
                showPageAppDialog(
                  child: const SizedBox(
                    width: 500,
                    height: 800,
                    child: AddMemberPage(),
                  ),
                  context: context,
                );
              },
            ),
          ),

          const SizedBox(
            width: 16,
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
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: .5,
                      color: Color(0xFFABABAB),
                    ),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(16, 0, 8, 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text('Tên'),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          height: 32,
                          width: 150,
                          child: TextField(
                            controller: _textController,
                            onChanged: (value) {},
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                  width: .3,
                                  color: Color(0xFFABABAB),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: .3,
                                  color: Color(0xFFABABAB),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text('Trạng thái'),
                        const SizedBox(
                          width: 8,
                        ),
                        const SelectStatusWidget(),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text('Kiểu'),
                        const SizedBox(
                          width: 8,
                        ),
                        const SelectTypeWidget(),
                        const SizedBox(
                          width: 12,
                        ),
                        VPMOutlinedButton(
                          padding: const EdgeInsets.all(8),
                          child: const Text(
                            'Đặt lại',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            _textController.text = '';
                            setState(() {});
                          },
                        ),
                        const SizedBox(
                          width: 12,
                        ),

                        // Menu mở trang nhanh

                        // const Spacer(),

                        ButtonFilterWidget(
                          onPressed: () {
                            _handlePressed();
                          },
                        ),

                        const Spacer(),
                        PopupMenuButton(
                          padding: const EdgeInsets.all(0),
                          // splashRadius: 12,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          tooltip: 'Menu',
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              padding: const EdgeInsets.all(0),
                              height: 40,
                              child: VPMTextButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  showAppDialog(
                                      child: const StatusCustomerPage(),
                                      context: context);
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  height: 40,
                                  padding: const EdgeInsets.all(8),
                                  child: const Text(
                                    'Trạng thái',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              padding: const EdgeInsets.all(0),
                              height: 40,
                              child: VPMTextButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  showAppDialog(
                                      child: const GroupCustomerPage(),
                                      context: context);
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  height: 40,
                                  padding: const EdgeInsets.all(8),
                                  child: const Text(
                                    'Nhóm khách hàng',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              padding: const EdgeInsets.all(0),
                              height: 40,
                              child: VPMTextButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  showAppDialog(
                                      child: const TypeCustomerPage(),
                                      context: context);
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  height: 40,
                                  padding: const EdgeInsets.all(8),
                                  child: const Text(
                                    'Kiểu khách hàng',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              padding: const EdgeInsets.all(0),
                              height: 40,
                              child: VPMTextButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  showAppDialog(
                                      child: const OtherFieldCustomerPage(),
                                      context: context);
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  height: 40,
                                  padding: const EdgeInsets.all(8),
                                  child: const Text(
                                    'Tùy chỉnh thông tin',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                          icon: const Icon(
                            CupertinoIcons.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizeTransition(
                      sizeFactor: CurvedAnimation(
                        curve: const Interval(
                          0.0,
                          0.5,
                          curve: Curves.bounceIn,
                        ),
                        parent: _controller,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            const Text('Nhóm'),
                            const SizedBox(
                              width: 8,
                            ),
                            const SelectGroupWidget(),
                            const SizedBox(
                              width: 12,
                            ),
                            VPMOutlinedButton(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                'Trạng thái',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                showAppDialog(
                                    child: const StatusCustomerPage(),
                                    context: context);
                              },
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            VPMOutlinedButton(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                'Nhóm khách hàng',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                showAppDialog(
                                    child: const GroupCustomerPage(),
                                    context: context);
                              },
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            VPMOutlinedButton(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                'Kiểu khách hàng',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                showAppDialog(
                                    child: const TypeCustomerPage(),
                                    context: context);
                              },
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            VPMOutlinedButton(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                'Tùy chỉnh thông tin',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                showAppDialog(
                                    child: const OtherFieldCustomerPage(),
                                    context: context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeaderCRMWidget(),
              Expanded(
                child: SingleChildScrollView(
                  // padding: const EdgeInsets.only(right: 12),
                  child: Wrap(
                    runSpacing: 0,
                    children: [
                      for (int i = 0; i < 20; i++) ...[
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
                            context.go('/feature/crm/detail/kjahdf');
                          },
                          child: const InfoMemberWidget(),
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
