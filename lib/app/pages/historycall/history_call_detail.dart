import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/app/widgets/historyCall/info_note_widget.dart';
import 'package:app_vbot/app/pages/phones/noti_call_page.dart';
import 'package:app_vbot/constant.dart';
import 'package:app_vbot/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class HistoryCallDetail extends StatefulWidget {
  const HistoryCallDetail({super.key});

  @override
  State<HistoryCallDetail> createState() => _HistoryCallDetailState();
}

class _HistoryCallDetailState extends State<HistoryCallDetail> {
  AppService appData = GetIt.instance.get<AppService>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _buildInfoUser() {
    return CardVPM(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   width: 100,
          //   height: 100,
          //   decoration: BoxDecoration(
          //       color: Colors.green, borderRadius: BorderRadius.circular(30)),
          //   alignment: Alignment.center,
          //   child: const Text(
          //     'HN',
          //     style: TextStyle(
          //         fontSize: 40,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white70),
          //   ),
          // ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: const Image(
              image: AssetImage('assets/image/avatar.jpg'),
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Hoàng Võ Hoài Nam',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            '0395001595',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Cước gọi: ', style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '10.000 VND',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Column(children: [
                  Text('Loại'),
                  Text(
                    'Gọi đi',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ]),
              ),
              SizedBox(
                height: 50,
                child: VerticalDivider(),
              ),
              Expanded(
                child: Column(children: [
                  Text('Hotline'),
                  Text(
                    '0987986917',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ]),
              ),
            ],
          ),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Column(children: [
                  Text('Thời gian gọi'),
                  Text(
                    '08:56:07 07/09/2023',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ]),
              ),
              SizedBox(
                height: 50,
                child: VerticalDivider(),
              ),
              Expanded(
                child: Column(children: [
                  Text('Thời lượng cuộc gọi'),
                  Text(
                    '00:00:00',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListNote() {
    return CardVPM(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Text(
              'Ghi chú',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                runSpacing: 12,
                spacing: 12,
                children: [
                  for (int i = 1; i < 10; i++)
                    InfoNoteWidget(
                      index: i,
                    )
                ],
              ),
              // ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoCaller() {
    return CardVPM(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: SizedBox(
        height: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Text(
                'Người gọi',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
              child: Row(
                children: [
                  // Container(
                  //   width: 100,
                  //   height: 100,
                  //   decoration: BoxDecoration(
                  //       color: Colors.green,
                  //       borderRadius: BorderRadius.circular(30)),
                  //   alignment: Alignment.center,
                  //   child: const Text(
                  //     'HN',
                  //     style: TextStyle(
                  //         fontSize: 40,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.white70),
                  //   ),
                  // ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: const Image(
                      image: AssetImage('assets/image/avatar.jpg'),
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    // height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          '09:10:28 22/08/2023',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          'Hoài Nam',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'VBot ID: ',
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: 'hoainam123',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        const CardVPM(
                          child: Text(
                            'PC',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTag() {
    return CardVPM(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: SizedBox(
        // height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Text(
                'Thẻ cuộc gọi',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,

                children: [
                  for (int i = 1; i < 5; i++)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: .3, color: borderColor),
                          ),
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text('Thẻ cuộc gọi $i'),
                    ),
                ],
                // ),
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
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Chi tiết cuộc gọi',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  CardVPM(
                    child: Row(
                      children: [
                        const BoxLoadingVBot(),
                        const SizedBox(
                          width: 12,
                        ),
                        VPMOutlinedButton(
                          padding: const EdgeInsets.fromLTRB(8, 14, 12, 14),
                          onPressed: () {
                            appData.setShowSmallCall(true);
                            showCallAppDialog(
                                onDialogDismiss: () {
                                  // appData.setShowSmallCall(true);
                                },
                                child: const NotiCallPage(),
                                context: context);
                          },
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
                                'Gọi điện',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        VPMOutlinedButton(
                          padding: const EdgeInsets.fromLTRB(8, 14, 12, 14),
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(
                                CupertinoIcons.clock_fill,
                                size: 20,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Lịch sử gọi',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Expanded(child: _buildInfoUser()),
                          const SizedBox(
                            height: 12,
                          ),
                          _buildInfoCaller()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    _buildInfoTag(),
                    const SizedBox(
                      height: 12,
                    ),
                    _buildListNote(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
