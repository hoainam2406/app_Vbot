import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/pages/login/login_page.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/app/widgets/setting/change_group_widget.dart';
import 'package:app_vbot/app/widgets/setting/select_language_widget.dart';
import 'package:app_vbot/app/widgets/setting/select_microphone_widget.dart';
import 'package:app_vbot/app/widgets/setting/select_speaker_widget.dart';
import 'package:app_vbot/app/widgets/simple_widget.dart';
import 'package:app_vbot/constant.dart';
import 'package:app_vbot/service/app_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

enum SingingCharacter { light, dark, system }

class _SettingsPageState extends State<SettingsPage> {
  int select = 1;

  @override
  void initState() {
    if (mounted) {
      setState(() {
        select = 1;
      });
    }
    // TODO: implement initState
    super.initState();
  }

  Widget _buildInfoAccount() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thông tin tài khoản',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Nhóm hiện tại',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          CardVPM(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)),
                  alignment: Alignment.center,
                  child: const Text(
                    'HN',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Text(
                  'Nhóm Nam',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          VPMOutlinedButton(
            child: const Text(
              'Chuyển nhóm',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              showPageAppDialog(
                child: const SizedBox(
                    width: 450, height: 500, child: ChangeGroupWidget()),
                context: context,
              );
            },
          ),
          const SizedBox(
            height: 36,
          ),
          const Text(
            'Tài khoản',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            '10.000.000 VND',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 36,
          ),
          const Text(
            'Gói VBot',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Hạn gói VBot: 12/12/2023',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildNotification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'Thông báo',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 1; i < 15; i++)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: .3,
                          color: borderColor,
                        ),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thông báo',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Tài khoản thành viên Hoài Nam(hoainam) trong nhóm Nhóm Nam(PR202307051516359801) còn dưới 0 VNĐ. Vui lòng nạp tiền để dịch vụ không bị gián đoạn',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '11:03:04 12/12/2023',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
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

  SingingCharacter? _character = SingingCharacter.light;
  Widget _buildSetting() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cài đặt chung',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Chủ đề',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          VPMTextButton(
            onPressed: () {
              setState(() {
                _character = SingingCharacter.light;
              });
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              width: 150,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<SingingCharacter>(
                    activeColor: Colors.green.shade500,
                    value: SingingCharacter.light,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  const Text(
                    'Sáng',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          VPMTextButton(
            onPressed: () {
              setState(() {
                _character = SingingCharacter.dark;
              });
            },
            child: Container(
              width: 150,
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<SingingCharacter>(
                    activeColor: Colors.green.shade500,
                    value: SingingCharacter.dark,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  const Text(
                    'Tối',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          VPMTextButton(
            onPressed: () {
              setState(() {
                _character = SingingCharacter.system;
              });
            },
            child: Container(
              width: 150,
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<SingingCharacter>(
                    activeColor: Colors.green.shade500,
                    value: SingingCharacter.system,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  const Text(
                    'Hệ thống',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Ngôn ngữ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          const SelectLanguageWidget(),
          const Spacer(),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              'Ver 1.0.0.0 Ⓒ 2023 copyright VPMEDIA',
              // style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  bool checked = false;
  bool checkbox = false;
  bool checkbox2 = false;
  Widget _buildSettingCall() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cài đặt cuộc gọi',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Thông báo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Khhi tắt tất cả cuộc gọi đến sẽ không hiển thị trên VBot PC. Bạn vẫn nhận được thông báo cuộc gọi trên VBot điện thoại như bình thường',
          ),
          const SizedBox(
            height: 12,
          ),
          CardVPM(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 40,
                  height: 10,
                  child: Transform.scale(
                    scale: .6,
                    child: Switch(
                      activeColor: Colors.green.shade500,
                      value: checked,
                      onChanged: (bool value) {
                        setState(() {
                          checked = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 25,
                  child: Text(
                    checked ? 'Bật' : 'Tắt',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Microphone',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          const SelectMicroPhoneWidget(),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Checkbox(
                activeColor: Colors.green.shade500,
                side: const BorderSide(width: .5),
                value: checkbox,
                onChanged: (value) {
                  setState(() {
                    checkbox = value!;
                  });
                },
              ),
              const Text(
                'Không nhận cuộc gọi trên thiết bị này khi không có Microphone',
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Loa/Tai nghe',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          const SelectSpeakerWidget(),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Checkbox(
                activeColor: Colors.green.shade500,
                side: const BorderSide(width: .5),
                value: checkbox2,
                onChanged: (value) {
                  setState(() {
                    checkbox2 = value!;
                  });
                },
              ),
              const Text(
                'Không nhận cuộc gọi trên thiết bị này khi không có Loa/Tai nghe',
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget selecPage(int selected) {
    return selected == 1
        ? _buildInfoAccount()
        : selected == 2
            ? _buildNotification()
            : selected == 3
                ? _buildSetting()
                : _buildSettingCall();
  }

  AppService appData = GetIt.instance.get<AppService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Cài đặt',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 12, 12),
              child: Column(
                children: [
                  VPMSelectionWidget(
                    select: select == 1 ? true : false,
                    padding: EdgeInsets.zero,
                    borderRadius: 12,
                    child: VPMOutlinedButton(
                      padding: const EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Row(
                          children: [
                            // Container(
                            //   width: 60,
                            //   height: 60,
                            //   clipBehavior: Clip.hardEdge,
                            //   decoration: BoxDecoration(
                            //       color: Colors.green,
                            //       borderRadius: BorderRadius.circular(12)),
                            //   alignment: Alignment.center,
                            //   child: const Text(
                            //     'HN',
                            //     style: TextStyle(
                            //         fontSize: 15,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.white70),
                            //   ),
                            // ),
                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Hoàng Võ Hoài Nam',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.right,
                                    text: const TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'VBot ID: ',
                                            style: TextStyle(
                                                // fontWeight: FontWeight.w600,
                                                color: Colors.black)),
                                        TextSpan(
                                            text: 'nam123',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        select = 1;
                        setState(() {});
                      },
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 24,
                  ),
                  VPMSelectionWidget(
                    select: select == 2 ? true : false,
                    padding: EdgeInsets.zero,
                    borderRadius: 12,
                    child: VPMOutlinedButton(
                      padding: const EdgeInsets.all(0),
                      child: const Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.bell_fill),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Thông báo',
                                style: TextStyle(
                                  // color: Colors.black,
                                  // fontWeight: FontWeight.normal,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )),
                      onPressed: () {
                        select = 2;
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  VPMSelectionWidget(
                    select: select == 3 ? true : false,
                    padding: EdgeInsets.zero,
                    borderRadius: 12,
                    child: VPMOutlinedButton(
                      padding: const EdgeInsets.all(0),
                      child: const Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.gear_alt_fill,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Cài đặt chung',
                                style: TextStyle(
                                  // color: Colors.black,
                                  // fontWeight: FontWeight.normal,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )),
                      onPressed: () {
                        select = 3;
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  VPMSelectionWidget(
                    select: select == 4 ? true : false,
                    padding: EdgeInsets.zero,
                    borderRadius: 12,
                    child: VPMOutlinedButton(
                      padding: const EdgeInsets.all(0),
                      child: const Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.phone_fill),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Cài đặt cuộc gọi',
                                style: TextStyle(
                                  // color: Colors.black,
                                  // fontWeight: FontWeight.normal,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )),
                      onPressed: () {
                        select = 4;
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  VPMOutlinedButton(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: const Row(
                          children: [
                            Icon(CupertinoIcons.power),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Đăng xuất',
                              style: TextStyle(
                                // color: Colors.black,
                                // fontWeight: FontWeight.normal,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )),
                    onPressed: () {
                      logoutDialog(
                          // logout: () {
                          //   Navigator.pushAndRemoveUntil(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const Login()),
                          //       (Route<dynamic> route) => false);
                          //   // context.go('/login');
                          //   appData.setIndexPage(true);
                          // },
                          // cancel: () {},
                          onPressed: () {
                            context.go('/historyCall');
                          },
                          context: context,
                          content: 'Xác nhận đăng xuất tài khoản');
                    },
                  ),
                ],
              ),
            ),
          ),
          const VerticalDivider(
            width: 1,
          ),
          Expanded(
            flex: 3,
            child: selecPage(select),
          ),
        ],
      ),
    );
  }
}
