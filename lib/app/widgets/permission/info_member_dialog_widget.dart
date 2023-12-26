import 'package:app_vbot/constant.dart';
import 'package:flutter/material.dart';

class InfoMemberDialogWodget extends StatelessWidget {
  const InfoMemberDialogWodget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: .3,
            color: borderColor,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Container(
          //   width: 40,
          //   height: 40,
          //   decoration: BoxDecoration(
          //     color: Colors.green,
          //     borderRadius: BorderRadius.circular(25),
          //   ),
          //   alignment: Alignment.center,
          //   child: const Text(
          //     'HN',
          //     style: TextStyle(
          //         fontSize: 10,
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
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hoàng Võ Hoài Nam ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Vbot ID: ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: 'hoainam123',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Spacer(),
        ],
      ),
    );
  }
}
