import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/pages/CRM/otherField/update_other_field_customer_page.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherFieldDetailCustomerPage extends StatefulWidget {
  const OtherFieldDetailCustomerPage({super.key});

  @override
  State<OtherFieldDetailCustomerPage> createState() =>
      _OtherFieldDetailCustomerPageState();
}

class _OtherFieldDetailCustomerPageState
    extends State<OtherFieldDetailCustomerPage> {
  Widget _nameOtherField() {
    return CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
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
          const SizedBox(
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
                contentPadding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 8, right: 26),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(
                    width: .5,
                    color: borderColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: .5,
                    color: borderColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _descriptionOtherField() {
    return CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mô tả',
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            // decoration: InputDecoration(
            //   border: OutlineInputBorder(
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(12),
            //     ),
            //   ),
            //   // contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            // ),
            decoration: InputDecoration(
              // contentPadding:
              //     const EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 26),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                borderSide: BorderSide(
                  width: .5,
                  color: borderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: .5,
                  color: borderColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            minLines: 4,
            maxLines: 4,
          ),
        ],
      ),
    );
  }

  Widget _typeData() {
    return CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kiểu dữ liệu',
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
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
                contentPadding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 8, right: 26),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(
                    width: .5,
                    color: borderColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: .5,
                    color: borderColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _requireData() {
    return CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bắt buộc nhập kiểu dữ liệu',
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
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
                contentPadding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 8, right: 26),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(
                    width: .5,
                    color: borderColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: .5,
                    color: borderColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
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
                'Thông tin chi tiết',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              VPMOutlinedButtonAdd2(
                child: Container(
                  alignment: Alignment.center,
                  // width: double.maxFinite,
                  child: const Text(
                    'Sửa',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
                onPressed: () {
                  showAppDialog(
                      child: const UpdateOtherFieldCustomerPage(),
                      context: context);
                },
              )
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _nameOtherField(),
                  const SizedBox(
                    height: 12,
                  ),
                  _descriptionOtherField(),
                  const SizedBox(
                    height: 12,
                  ),
                  _typeData(),
                  const SizedBox(
                    height: 12,
                  ),
                  _requireData(),
                  const SizedBox(
                    height: 12,
                  ),
                  VPMOutlinedButtonDelete2(
                    // padding: const EdgeInsets.all(20),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Xóa',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    onPressed: () {
                      deleteDialog(
                          context: context,
                          description: 'Xóa trạng thái thành viên');
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
