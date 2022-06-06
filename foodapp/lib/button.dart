import 'package:flutter/material.dart';
import 'package:foodapp/ItemModal.dart';
import 'package:foodapp/cartitemshow.dart';
import 'package:foodapp/main.dart';
import 'package:hive/hive.dart';

class Button extends StatefulWidget {
  final String idnumber;
  final double itemprice;
  final Container itemphoto;
  final String itname;
  const Button({
    Key? key,
    required this.idnumber,
    required this.itemprice,
    required this.itemphoto,
    required this.itname,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  int quantity = 0;
  Box<ItemModal>? finalbox;

  @override
  void initState() {
    widgetholder1 = firstwidget();
    super.initState();
    finalbox = Hive.box<ItemModal>(BoxName);
  }

  Widget? widgetholder1;

  int item = 0;

  Widget firstwidget() {
    return newMethod();
  }

  Container newMethod() {
    return Container(
      height: 25,
      width: 80,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          )),
          onPressed: () {
            ItemModal itemModal1 = ItemModal(
                id: widget.idnumber,
                qty: quantity,
                price: widget.itemprice,
                itemimage: widget.itemphoto,
                itemname: widget.itname);

            finalbox!.add(itemModal1);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Mycarditem(boxnew: finalbox!)));
            setState(() {
              widgetholder1 = secondwidget1();
            });
          },
          child: const Text('+ ADD')),
    );
  }

  Widget secondwidget1() {
    return Container(
      height: 25,
      width: 120,
      child: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (item != 0) {
                  item = item - 1;
                  quantity = item;
                  print(item);
                }
              });
            },
            tooltip: 'Decrement',
            child: Icon(Icons.horizontal_rule),
          ),
          Text(
            '$item',
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                item = item + 1;
                quantity = item;
              });

              print(item);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widgetholder1!;
  }
}
