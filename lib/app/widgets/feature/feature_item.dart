import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/model/feature_app_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key, required this.item, required this.onPressed});
  final KeyFeature item;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return VPMOutlinedButton(
      padding: const EdgeInsets.all(12),
      // style: const ButtonStyle(
      //   padding: MaterialStatePropertyAll(
      //     EdgeInsets.all(12),
      //   ),
      // ),
      // onPressed: () {
      //   context.go('/feature/crm');
      // },
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(4),
        width: 300,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      item.iconValue,
                      size: 25,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        // 'Quản lý khách hàng',
                        item.titleValue,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        // '18h giá 700k 19h30 giá 600k 21h giá 450k -Thứ 7 và chủ nhật cụm sân mới DT 30x50 BKC Linh đàm có sân mới ae đặt cố định rẻ hơn ,sân dưới 18h 19h30 gía 500k đt 0982627233',
                        item.desValue,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          // fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
