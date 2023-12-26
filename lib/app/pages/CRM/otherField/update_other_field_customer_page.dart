import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/widgets/crm/otherField/select_require_type_data_widget.dart';
import 'package:app_vbot/app/widgets/crm/otherField/select_type_data_widget.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateOtherFieldCustomerPage extends StatefulWidget {
  const UpdateOtherFieldCustomerPage({super.key});

  @override
  State<UpdateOtherFieldCustomerPage> createState() =>
      _UpdateOtherFieldCustomerPageState();
}

const List<String> typedata = <String>[
  'Kiểu văn bản tối đa 255 ký tự',
  'Kiểu văn bản',
  'Kiểu số tối đa 12 ký tự và 6 số thập phân',
  'Kiểu ngày tháng'
];

const List<String> requireData = <String>[
  'Bắt buộc',
  'Không bắt buộc',
];

class _UpdateOtherFieldCustomerPageState
    extends State<UpdateOtherFieldCustomerPage> {
  String dropdownValue = typedata.first;
  String dropdownValue1 = requireData.first;

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
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                TextSpan(
                  text: '*',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                ),
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

  Widget _description() {
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
          SizedBox(
            height: 40,
            child: TextField(
              // decoration: InputDecoration(
              //   border: OutlineInputBorder(
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(12),
              //     ),
              //   ),
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
              minLines: 5,
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _typeData() {
    return const CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kiểu dữ liệu',
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 8,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(12.0),
          //     border: Border.all(width: 0.3),
          //   ),
          //   child: DropdownButton(
          //     focusColor: Colors.transparent,
          //     borderRadius: BorderRadius.circular(12),
          //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //     items: typedata
          //         .map((value) => DropdownMenuItem(
          //               value: value,
          //               child: Text(value),
          //             ))
          //         .toList(),
          //     value: dropdownValue,
          //     onChanged: (value) {
          //       setState(() {
          //         dropdownValue = value!;
          //       });
          //     },
          //   ),
          // ),
          SelectTypeDataWidget()
        ],
      ),
    );
  }

  Widget _requireData() {
    return const CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bắt buộc nhập kiểu dữ liệu',
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 8,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(12.0),
          //     border: Border.all(width: 0.3),
          //   ),
          //   child: DropdownButton(
          //     focusColor: Colors.transparent,
          //     borderRadius: BorderRadius.circular(12),
          //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //     items: requireData
          //         .map((value) => DropdownMenuItem(
          //               value: value,
          //               child: Text(value),
          //             ))
          //         .toList(),
          //     value: dropdownValue1,
          //     onChanged: (value) {
          //       setState(() {
          //         dropdownValue1 = value!;
          //       });
          //     },
          //   ),
          // ),
          SelectRequireTypeDataWidget()
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
                'Cập nhật thông tin',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
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
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _nameOtherField(),
                  const SizedBox(
                    height: 12,
                  ),
                  _description(),
                  const SizedBox(
                    height: 12,
                  ),
                  _typeData(),
                  const SizedBox(
                    height: 12,
                  ),
                  _requireData(),
                  const SizedBox(
                    height: 16,
                  ),
                  VPMOutlinedButtonDelete2(
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
