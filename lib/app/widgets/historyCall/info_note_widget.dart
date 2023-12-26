import 'package:app_vbot/app/components/card.dart';
import 'package:flutter/cupertino.dart';

class InfoNoteWidget extends StatelessWidget {
  const InfoNoteWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 275,
      // constraints: const BoxConstraints(minWidth: 275, maxWidth: 290),
      child: CardVbot(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CardVbot(
            //   padding: const EdgeInsets.all(0),
            //   child: Container(
            //       width: 30,
            //       height: 30,
            //       alignment: Alignment.center,
            //       child: Text(index.toString())),
            // ),
            // const SizedBox(
            //   width: 8,
            // ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CardVbot(
                      //   padding: const EdgeInsets.all(0),
                      //   child: Container(
                      //       width: 30,
                      //       height: 30,
                      //       alignment: Alignment.center,
                      //       child: Text(index.toString())),
                      // ),
                      // const SizedBox(
                      //   width: 8,
                      // ),
                      Expanded(
                        child: Text(
                          'Chưa bao giờ e xả sập giá ntn. Thanh lý chiếc kệ 4 tầng để đồ y hình!!!',
                          style: TextStyle(fontWeight: FontWeight.w600),
                          // overflow: TextOverflow.clip,
                          // maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Con voi này hại thật .. 19 năm 2 tháng 4 ngày Rời Bỏ . Giờ nghe Voi hát rơi nước mắt thành dòng luôn nè Voi. Ko cầm được nước mắt 😂❤😂NHẬT TRƯỜNG LỆ.',
                    style: TextStyle(fontSize: 12),
                    // maxLines: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
