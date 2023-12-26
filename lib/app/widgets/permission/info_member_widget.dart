import 'package:app_vbot/app/components/card.dart';
import 'package:flutter/material.dart';

class InfoMemberWidget extends StatelessWidget {
  const InfoMemberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardVPM(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        width: 250,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Container(
            //   width: 50,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     color: Colors.green,
            //     borderRadius: BorderRadius.circular(12),
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
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: const Image(
                image: AssetImage('assets/image/avatar.jpg'),
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
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
          ],
        ),
      ),
    );
  }
}
