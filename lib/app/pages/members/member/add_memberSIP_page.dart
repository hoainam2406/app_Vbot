import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/widgets/members/textfield_password_widget.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_vbot/app/components/button_vpm.dart';

class AddMemberSIP extends StatefulWidget {
  const AddMemberSIP({super.key});

  @override
  State<AddMemberSIP> createState() => _AddMemberSIPState();
}

class _AddMemberSIPState extends State<AddMemberSIP> {
  Widget _nameSIP() {
    return CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Tên hiển thị',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 40,
            child: TextField(
              // decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //         borderRadius: const BorderRadius.all(
              //           Radius.circular(12),
              //         ),
              //         borderSide: BorderSide(width: .3, color: borderColor)),
              //     contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0)),

              decoration: InputDecoration(
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
        ],
      ),
    );
  }

  Widget _emailSIP() {
    return const CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email'),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 40,
            child: TextField(
              // decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(12),
              //       ),
              //     ),
              //     contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0)),

              decoration: InputDecoration(
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
        ],
      ),
    );
  }

  Widget _phoneNumberSIP() {
    return const CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Số điện thoại'),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 40,
            child: TextField(
              // decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(12),
              //       ),
              //     ),
              //     contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0)),

              decoration: InputDecoration(
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
        ],
      ),
    );
  }

  Widget _nameAccountSIP() {
    return CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text:
                        'Tên tài khoản (Có 4 ký tự trở lên, bao gồm chữ cái và số không có ký tự đặc biệt)',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 40,
            child: TextField(
              // decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(12),
              //       ),
              //     ),
              //     contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0)),

              decoration: InputDecoration(
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
        ],
      ),
    );
  }

  Widget _passwordSIP() {
    return CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Mật khẩu', style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFieldPasswordWidget(
            onChange: (value) {
              // print('Nam log pass $value');
            },
          ),
        ],
      ),
    );
  }

  Widget _passwordAuthenticationSIP() {
    return CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Xác thực mật khẩu',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFieldPasswordWidget(
            onChange: (value) {
              // print('Nam log Showpass $value');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VPMIconButton(
                icon: const Icon(
                  CupertinoIcons.back,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                tooltip: 'Quay lại',
              ),
              const Text(
                'Thêm tài khoản thiết bị',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const SizedBox()
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Wrap(
                runSpacing: 8,
                children: [
                  _nameSIP(),
                  _emailSIP(),
                  _phoneNumberSIP(),
                  _nameAccountSIP(),
                  _passwordSIP(),
                  _passwordAuthenticationSIP(),
                  VPMOutlinedButtonAdd2(
                    child: const SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        'Tạo tài khoản',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
