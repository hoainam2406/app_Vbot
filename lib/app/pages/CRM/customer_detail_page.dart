import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/pages/CRM/add_member_page.dart';
import 'package:app_vbot/app/widgets/crm/card_phone_widget.dart';
import 'package:app_vbot/app/widgets/crm/other_info_widget.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerDetailPage extends StatefulWidget {
  const CustomerDetailPage({super.key, this.content});
  final String? content;

  @override
  State<CustomerDetailPage> createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  String get content => widget.content ?? '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('Nam log $content');
  }

  Widget _buildInfoUser() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        // const SizedBox(
        //   height: 24,
        // ),
        // Container(
        //   width: 140,
        //   height: 140,
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
            width: 140,
            height: 140,
          ),
        ),
        // const SizedBox(
        //   height: 12,
        // ),
        const Text(
          'Hoàng Võ Hoài Nam',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ngày tạo: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '2023-09-11 11:00:27',
                          // style: TextStyle(fontWeight: FontWeight.w600),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ]),

                const Divider(),
                const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mã khách hàng: ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: Text(
                          'D230911110027491555',
                          // style: TextStyle(fontWeight: FontWeight.w600),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ]),
                const Divider(),
                // Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text('Nhóm khách hàng: '),
                //       Expanded(
                //         child: Text(
                //           '🤣 hot hót: nghi vấn đội bóng NGHI XUÂN vô địch giải HĐH Nghệ Tĩnh khi tuyển thủ môn nhập tịch đến từ Châu Phi: romero ô na ná ANH NGUYÊN... và cầu thủ này đã xuất sắc cân luôn 2 quả pen của đối phương! ',
                //           style: TextStyle(fontWeight: FontWeight.w600),
                //           overflow: TextOverflow.clip,
                //         ),
                //       )
                //     ]),
                RichText(
                  // textAlign: TextAlign.right,
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Nhóm khách hàng: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      TextSpan(
                        text:
                            '🤣 hot hót: nghi vấn đội bóng NGHI XUÂN vô địch giải HĐH Nghệ Tĩnh khi tuyển thủ môn nhập tịch đến từ Châu Phi: romero ô na ná ANH NGUYÊN... và cầu thủ này đã xuất sắc cân luôn 2 quả pen của đối phương! ',
                        style: TextStyle(
                          // fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                // const Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text('Trạng thái: '),
                //       Expanded(
                //         child: Text(
                //           'FC Chuồng Gà có sân nhà Sân Đầm Hồng II ( sân số 1) Tìm đối giao lưu:   19h15 thứ 6 tuần này 15/12  - Trình độ TBY - Yếu xịn sò - Hạnh Kiểm: tốt, ko CTM, U40  Trân trọng và kính mời các đội book lịch giao lưu ạ. Liên hệ Ngọc : 0982 85 84 86',
                //           style: TextStyle(fontWeight: FontWeight.w600),
                //           overflow: TextOverflow.clip,
                //         ),
                //       )
                //     ]),

                RichText(
                  // textAlign: TextAlign.right,
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Trạng thái: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      TextSpan(
                        text:
                            'FC Chuồng Gà có sân nhà Sân Đầm Hồng II ( sân số 1) Tìm đối giao lưu:   19h15 thứ 6 tuần này 15/12  - Trình độ TBY - Yếu xịn sò - Hạnh Kiểm: tốt, ko CTM, U40  Trân trọng và kính mời các đội book lịch giao lưu ạ. Liên hệ Ngọc : 0982 85 84 86',
                        style: TextStyle(
                          // fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                // const Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text('Loại khách hàng: '),
                //       Expanded(
                //         child: Text(
                //           'Sân bóng đông mỹ thanh trì 🍀🍀❤️ Mai thứ 6 khung 18h và 19h30 còn đối chờ ghép , các đội liên hệ sân sớm nhé 👍 Call: 0986316295',
                //           style: TextStyle(fontWeight: FontWeight.w600),
                //           overflow: TextOverflow.clip,
                //         ),
                //       )
                //     ]),
                RichText(
                  // textAlign: TextAlign.right,
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Loại khách hàng: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      TextSpan(
                        text:
                            'Sân bóng đông mỹ thanh trì 🍀🍀❤️ Mai thứ 6 khung 18h và 19h30 còn đối chờ ghép , các đội liên hệ sân sớm nhé 👍 Call: 0986316295',
                        style: TextStyle(
                          // fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListPhoneNumber() {
    return CardVPM(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Text(
                'Số điện thoại',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Divider(
              height: 1,
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     padding: const EdgeInsets.only(top: 8),
            //     child: Container(
            //       width: double.infinity,
            //       padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            //       child: Wrap(
            //         runSpacing: 8,
            //         spacing: 8,
            //         // alignment: WrapAlignment.spaceAround,
            //         children: [
            //           for (int i = 1; i < 15; i++)
            //             CardPhoneWidget(
            //               index: i,
            //             )
            //         ],
            //       ),
            //     ),
            //   ),
            // )
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Wrap(
                runSpacing: 8,
                spacing: 8,
                // alignment: WrapAlignment.spaceAround,
                children: [
                  for (int i = 1; i < 15; i++)
                    CardPhoneWidget(
                      index: i,
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListOtherInfor() {
    return CardVPM(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: SizedBox(
        width: double.infinity,
        // height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Text(
                'Thông tin khác',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Divider(
              height: 1,
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     padding: const EdgeInsets.only(top: 8),
            //     child: Container(
            //       width: double.infinity,
            //       padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            //       child: Wrap(
            //         runSpacing: 12,
            //         spacing: 12,
            //         children: [
            //           for (int i = 1; i < 9; i++)
            //             OtherInfoWidget(
            //               index: i,
            //             ),
            //         ],
            //       ),
            //     ),
            //   ),
            // )
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Wrap(
                runSpacing: 12,
                spacing: 12,
                children: [
                  for (int i = 1; i < 9; i++)
                    OtherInfoWidget(
                      index: i,
                    ),
                ],
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
          'Chi tiết khách hàng',
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
                        ButtonRefreshVBot(onPressed: () {}),
                        const SizedBox(
                          width: 12,
                        ),
                        VPMOutlinedButton(
                          padding: const EdgeInsets.fromLTRB(8, 14, 12, 14),
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
                          child: const Row(
                            children: [
                              Icon(
                                CupertinoIcons.pen,
                                size: 20,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Chỉnh sửa',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        VPMOutlinedButton(
                          padding: const EdgeInsets.fromLTRB(8, 14, 12, 14),
                          onPressed: () {
                            deleteDialog(
                                context: context, description: 'content');
                          },
                          child: const Row(
                            children: [
                              Icon(
                                CupertinoIcons.delete,
                                size: 20,
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
                      child: CardVPM(
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                          child: _buildInfoUser()),
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
                    _buildListPhoneNumber(),
                    const SizedBox(
                      height: 12,
                    ),
                    _buildListOtherInfor()
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
