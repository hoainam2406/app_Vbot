import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/widgets/crm/status/select_color_status_widget.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateTypeCustomerPage extends StatefulWidget {
  const UpdateTypeCustomerPage({super.key});

  @override
  State<UpdateTypeCustomerPage> createState() => _UpdateTypeCustomerPageState();
}

class _UpdateTypeCustomerPageState extends State<UpdateTypeCustomerPage> {
  Widget _nameType() {
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

  Widget _codeType() {
    return CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mã',
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

  Widget _colorType() {
    return const CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Màu',
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 8,
          ),
          SelectColorStatusWidget(),
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
                'Cập nhật loại khách hàng',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox()
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _nameType(),
              const SizedBox(
                height: 12,
              ),
              _codeType(),
              const SizedBox(
                height: 12,
              ),
              _colorType(),
              const SizedBox(
                height: 16,
              ),
              VPMOutlinedButtonDelete2(
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
