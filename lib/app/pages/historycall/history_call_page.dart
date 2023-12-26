import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/pages/historycall/history_call_VBot_page.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/app/widgets/historyCall/button_filter_widget.dart';
import 'package:app_vbot/app/widgets/historyCall/header_history_call_widget.dart';
import 'package:app_vbot/app/widgets/historyCall/info_call_widget.dart';
import 'package:app_vbot/app/widgets/historyCall/select_hotline_call_widget.dart';
import 'package:app_vbot/app/widgets/historyCall/select_type_call_widget2.dart';
import 'package:app_vbot/service/app_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HistoryCallPage extends StatefulWidget {
  const HistoryCallPage({super.key, required this.detailsPath});
  final String detailsPath;

  @override
  State<HistoryCallPage> createState() => _HistoryCallPageState();
}

class _HistoryCallPageState extends State<HistoryCallPage>
    with SingleTickerProviderStateMixin {
  AppService appData = GetIt.instance.get<AppService>();
  String get detailsPath => widget.detailsPath;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _textController = TextEditingController(text: '');
  late AnimationController _controller;

  // AppService appData = GetIt.instance.get<AppService>();

  final List<String> items = [
    'Tất cả',
    '0395001595',
    '0395001596',
    'VBot Hotline',
  ];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    if (_isExpanded == true) {
      _controller.value = 1;
    }

    // print(appData.isLogout);
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

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      _dateController.text = picked.toString().split(" ")[0];
    }
  }

  void validateInput(String text) {
    List allowInputs = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    if (text.isNotEmpty) {
      List<String> textArr = text.split("");
      List<String> allowChars = [];

      for (var element in textArr) {
        if (allowInputs.contains(element)) {
          allowChars.add(element);
        } else {
          if (allowChars.isEmpty && element == '+') {
            allowChars.add(element);
          }
        }
      }

      String allowStr = allowChars.join();
      _textController.text = allowStr;
      _textController.selection =
          TextSelection.collapsed(offset: _textController.text.length);
    }
  }

  Widget infoHistoryCall() {
    return VPMOutlinedButton(
      child: Column(children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: const Text(
            'HN',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'Hoài Nam',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
        )
      ]),
      onPressed: () {
        context.go(detailsPath);
      },
    );
  }

  Widget hotline() {
    return const CardVPM(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hotline'),
          SizedBox(
            height: 8,
          ),
          SelectHotlineCallWidget(),
        ],
      ),
    );
  }

  Widget type() {
    return const CardVPM(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Loại'),
          SizedBox(
            height: 8,
          ),
          SelectTypeCallWidget2(),
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
      //             'Lịch sử gọi',
      //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(CupertinoIcons.clock),
      //         title: const Text('Lịch sử gọi VBot'),
      //         onTap: () {
      //           showAppDialog(
      //               child: const HistoryCallVBotPage(), context: context);
      //         },
      //       ),
      //       const Divider(),
      //       Padding(
      //         padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             hotline(),
      //             const SizedBox(
      //               height: 12,
      //             ),
      //             type(),
      //             const SizedBox(
      //               height: 12,
      //             ),
      //             const Text('Số điện thoại'),
      //             const SizedBox(
      //               height: 8,
      //             ),
      //             SizedBox(
      //               height: 40,
      //               child: TextField(
      //                 controller: _textController,
      //                 onChanged: (value) {
      //                   validateInput(value);
      //                 },
      //                 decoration: const InputDecoration(
      //                   border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.all(
      //                       Radius.circular(12),
      //                     ),
      //                   ),
      //                   contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 12,
      //             ),
      //             const Text('Từ'),
      //             const SizedBox(
      //               height: 8,
      //             ),
      //             SizedBox(
      //               // width: 380,
      //               height: 45,
      //               child: TextField(
      //                 controller: _dateController,
      //                 decoration: const InputDecoration(
      //                   contentPadding: EdgeInsets.all(0),
      //                   border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.all(
      //                       Radius.circular(12),
      //                     ),
      //                   ),
      //                   filled: true,
      //                   prefixIcon: Icon(Icons.calendar_month_sharp),
      //                 ),
      //                 readOnly: true,
      //                 onTap: () {
      //                   _selectDate();
      //                 },
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 12,
      //             ),
      //             const Text('Đến'),
      //             const SizedBox(
      //               height: 8,
      //             ),
      //             SizedBox(
      //               // width: 380,
      //               height: 45,
      //               child: TextField(
      //                 controller: _dateController,
      //                 decoration: const InputDecoration(
      //                   contentPadding: EdgeInsets.all(0),
      //                   border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.all(
      //                       Radius.circular(12),
      //                     ),
      //                   ),
      //                   filled: true,
      //                   prefixIcon: Icon(Icons.calendar_month_sharp),
      //                 ),
      //                 readOnly: true,
      //                 onTap: () {
      //                   _selectDate();
      //                 },
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 12,
      //             ),
      //             VPMOutlinedButtonAdd2(
      //               child: Container(
      //                 alignment: Alignment.center,
      //                 width: double.infinity,
      //                 child: const Text(
      //                   'Tìm kiếm',
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.w600, color: Colors.black),
      //                 ),
      //               ),
      //               onPressed: () {
      //                 _textController.text = '';
      //                 _dateController.text = '';
      //               },
      //             ),
      //             const SizedBox(
      //               height: 12,
      //             ),
      //             VPMOutlinedButton(
      //                 child: Container(
      //                   alignment: Alignment.center,
      //                   width: double.infinity,
      //                   child: const Text(
      //                     'Làm mới',
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.w600, color: Colors.black),
      //                   ),
      //                 ),
      //                 onPressed: () {
      //                   _textController.text = '';
      //                   _dateController.text = '';
      //                 })
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Lịch sử gọi',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          const BoxLoading(),
          const SizedBox(
            width: 12,
          ),
          ButtonRefreshVBot(onPressed: () {}),
          const SizedBox(
            width: 12,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Hotline'),
                    const SizedBox(
                      width: 8,
                    ),
                    const SelectHotlineCallWidget(),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text('Loại'),
                    const SizedBox(
                      width: 8,
                    ),
                    const SelectTypeCallWidget2(),
                    const SizedBox(
                      width: 12,
                    ),
                    ButtonFilterWidget(onPressed: () {
                      _handlePressed();
                    }),
                    // VPMButton(child: const Text('data'), onPressed: () {}),
                    const Spacer(),
                    VPMOutlinedButton(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: const Row(
                        children: [
                          Icon(
                            CupertinoIcons.clock,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Lịch sử gọi',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      onPressed: () {
                        showAppDialog(
                            child: const HistoryCallVBotPage(),
                            context: context);
                      },
                    ),
                    // const SizedBox(
                    //   width: 12,
                    // ),
                    // ButtonFilterWidget(onPressed: () {
                    //   _handlePressed();
                    // }),
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
                        const Text('Số điện thoại'),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          height: 32,
                          width: 150,
                          child: TextField(
                            controller: _textController,
                            onChanged: (value) {
                              validateInput(value);
                            },
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
                        const Text('Từ'),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 150,
                          height: 32,
                          child: TextField(
                            controller: _dateController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
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
                              filled: true,
                              prefixIcon: Icon(
                                Icons.calendar_month_sharp,
                                size: 20,
                              ),
                              fillColor: Colors.transparent,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFFABABAB),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectDate();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text('Đến'),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 150,
                          height: 32,
                          child: TextField(
                            controller: _dateController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
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
                              filled: true,
                              prefixIcon: Icon(
                                Icons.calendar_month_sharp,
                                size: 20,
                              ),
                              fillColor: Colors.transparent,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFFABABAB),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectDate();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        // const Spacer(),
                        VPMOutlinedButtonAdd2(
                          padding: const EdgeInsets.all(8),
                          child: const Text(
                            'Tìm kiếm',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
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
                            _dateController.text = '';
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const HeaderHistoryCall(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Wrap(
                      children: [
                        for (int i = 0; i < 20; i++)
                          // infoHistoryCall(),
                          VPMButton(
                            // style: ButtonStyle(
                            //   padding: const MaterialStatePropertyAll(
                            //     EdgeInsets.all(0),
                            //   ),
                            //   shape: MaterialStatePropertyAll(
                            //     RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(0),
                            //     ),
                            //   ),
                            //   foregroundColor: const MaterialStatePropertyAll(
                            //     Colors.black,
                            //   ),
                            // ),
                            onPressed: () {
                              context.go(detailsPath);
                            },
                            child: const InfoCallWidget(),
                          ),
                      ],
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
