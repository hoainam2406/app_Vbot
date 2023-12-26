import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/widgets/crm/Select_hotline_widget.dart';
import 'package:app_vbot/app/widgets/crm/add_other_infomation_widget.dart';
import 'package:app_vbot/app/widgets/crm/phone_number_chip.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({super.key});

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  TextEditingController tfPhoneControler = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  List<String> phoneNumbers = [];
  Widget _nameCustomer() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: RichText(
            textAlign: TextAlign.right,
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Tên ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black)),
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        const Expanded(
          flex: 5,
          child: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: .3,
                    color: Color(0xFFABABAB),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _typeCustomer() {
    return const Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Kiểu khách hàng',
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 5,
          child: Row(
            children: [SelectHotlineWidget(), Spacer()],
          ),
        )
      ],
    );
  }

  Widget _statusCustomer() {
    return const Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Trạng thái',
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 5,
          child: Row(
            children: [SelectHotlineWidget(), Spacer()],
          ),
        )
      ],
    );
  }

  Widget _groupCustomer() {
    return const Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Nhóm khách hàng ',
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 5,
          child: Row(
            children: [SelectHotlineWidget(), Spacer()],
          ),
        )
      ],
    );
  }

  // Widget inputPhoneNUmbers() {
  //   return AppInputItem(
  //     title: 'Số điện thoại',
  //     body: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         TextBox(
  //           controller: tfPhoneControler,
  //           focusNode: phoneFocusNode,
  //           inputFormatters: <TextInputFormatter>[
  //             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
  //             FilteringTextInputFormatter.digitsOnly
  //           ],
  //           placeholder: 'Nhập số điện thoại',
  //           onSubmitted: (value) {
  //             addNumber(value);
  //           },
  //         ),
  //         Wrap(
  //           children: _listPhones(),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _phoneNumberCustomer() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: RichText(
            textAlign: TextAlign.right,
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Số điện thoại ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black)),
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child:
                    // TextField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(12),
                    //       ),
                    //     ),
                    //     contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         width: .3,
                    //         color: Color(0xFFABABAB),
                    //       ),
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(12),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    TextField(
                  controller: tfPhoneControler,
                  focusNode: phoneFocusNode,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  // placeholder: 'Nhập số điện thoại',
                  onSubmitted: (value) {
                    addNumber(value);
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Wrap(
                // direction: Axis.vertical,
                spacing: 8,
                runSpacing: 8,
                children: _listPhones(),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _listPhones() {
    return phoneNumbers.map((number) {
      int idx = phoneNumbers.indexOf(number);

      return Padding(
        padding: const EdgeInsets.only(top: 0, right: 0),
        child: PhoneNumberChip(
            label: number,
            onDeleted: (idx) {
              setState(() {
                phoneNumbers.removeAt(idx);
              });
            },
            index: idx),
      );
    }).toList();
  }

  void addNumber(String value) {
    setState(() {
      if (value != "" &&
          phoneNumbers.contains(value) == false &&
          phoneNumbers.length < 10) {
        phoneNumbers.add(value);
      }
    });
    tfPhoneControler.clear();
    phoneFocusNode.requestFocus();
  }

  Widget _codeCustomer() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Text(
                'Mã khách hàng',
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            )),
        SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: .3,
                        color: Color(0xFFABABAB),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Mã khách hàng để phân biệt khách hàng, mã khách hàng không trùng nhau. Bạn có thể sửa mã theo định dạng doanh nghiệp của bạn. Nếu để trống Vbot sẽ tự sinh mã khách hàng, bạn có thể cập nhật sau đó.',
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _addressCustomer() {
    return const Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Địa chỉ',
            textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 5,
          child: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: .3,
                    color: Color(0xFFABABAB),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _emailCustomer() {
    return const Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Email',
            textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 5,
          child: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: .3,
                    color: Color(0xFFABABAB),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _otherFieldCustomer() {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Text(
            'Thông tin 1',
            textAlign: TextAlign.right,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 5,
          child: SizedBox(
            height: 40,
            child: TextButton(
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.all(0),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                onPressed: () {
                  showPageAppDialog(
                      child:
                          const AddOtherInfomationWidget(name: 'Thông tin 1'),
                      context: context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: .3, color: borderColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                )),
          ),
        ),
      ],
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
                'Thêm liên hệ khách hàng',
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
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Wrap(
                runSpacing: 12,
                children: [
                  const Text(
                    'Thông tin cơ bản',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  _nameCustomer(),
                  _typeCustomer(),
                  _statusCustomer(),
                  _groupCustomer(),
                  _phoneNumberCustomer(),
                  _codeCustomer(),
                  _addressCustomer(),
                  _emailCustomer(),
                  const Text(
                    'Thông tin khác',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  for (int i = 1; i < 4; i++) ...[
                    _otherFieldCustomer(),
                  ]
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
