import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/material.dart';

class InfoCallWidget extends StatelessWidget {
  const InfoCallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 4, 0, 4),
      decoration: const BoxDecoration(
          // border: Border(
          //   bottom: BorderSide(
          //     width: .3,
          //     color: borderColor,
          //   ),
          // ),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(
            flex: 3,
            child: Text('09:23:01 12/12/2023',
                textAlign: TextAlign.left,
                style: TextStyle(
                    // fontSize: 16,
                    // color: borderColor
                    )),
          ),
          const SizedBox(
            width: 12,
          ),
          const Expanded(
            flex: 3,
            child: Text(
              '00:00:00',
              textAlign: TextAlign.left,
              style: TextStyle(
                  // fontSize: 16,
                  // color: borderColor,
                  ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green),
                  alignment: Alignment.center,
                  child: const Text(
                    'HN',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'Hoai Nam',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    // fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green),
                  alignment: Alignment.center,
                  child: const Text(
                    'HN',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'Hoai Nam',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      // fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(12)),
              child: const Text(
                'gọi đi',
                textAlign: TextAlign.center,
                style: TextStyle(
                    // fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Expanded(
            flex: 3,
            child: Text(
              '0395001595',
              textAlign: TextAlign.left,
              style: TextStyle(
                  // fontSize: 16,
                  // color: borderColor,
                  ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 4,
            child: Text(
              '',
              textAlign: TextAlign.left,
              style: TextStyle(color: borderColor
                  // fontSize: 16,
                  ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 4,
            child: Text(
              '',
              textAlign: TextAlign.left,
              style: TextStyle(color: borderColor
                  // fontSize: 16,
                  ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 2,
            // Nếu không dùng row thì kích thước của button sẽ bị kéo dài bằng chiều rộng của Expanded
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: VPMIconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.phone,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            // VPMIconButton(
            //   // style: ElevatedButton.styleFrom(
            //   //   shape: RoundedRectangleBorder(
            //   //     borderRadius: BorderRadius.circular(4),
            //   //   ),
            //   // ),
            //   // splashRadius: 20,
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.phone,
            //     color: Colors.black,
            //     size: 20,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
