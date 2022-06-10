import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardContainer extends StatelessWidget {
  final Color iconcolor;
  final String textweight;
  final String itemimage;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;
  final Widget additem;

  const CardContainer({
    Key? key,
    required this.iconcolor,
    required this.textweight,
    required this.itemimage,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.additem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey _buttonkey = GlobalKey();
    return Container(
      key: _buttonkey,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.check_box_outline_blank_outlined,
                        color: iconcolor,
                      ),
                      Icon(
                        Icons.circle,
                        color: iconcolor,
                        size: 12,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 8, left: 3),
                    child: Container(
                      width: 86,
                      height: 70,
                      child: Image.asset(itemimage),
                    ),
                  ),
                  Text(
                    textweight,
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ),
          ),
          Text(
            text1,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(text2,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text3,
                  style: TextStyle(color: Colors.black45),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    text4,
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black45),
                  ),
                ),
                Text(text5),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 15, top: 8),
              child: additem),
          Text(
            text6,
            style: TextStyle(color: Colors.black45),
          ),
          Text(text7, style: TextStyle(color: Colors.black45))
        ],
      ),
    );
  }
}
