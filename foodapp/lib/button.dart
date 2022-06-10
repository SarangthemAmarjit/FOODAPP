import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:foodapp/ItemModal.dart';
import 'package:foodapp/main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class QuantityButton extends StatefulWidget {
  final String idnumber;
  final double itemprice;
  final String itemphoto;
  final String itname;
  const QuantityButton({
    Key? key,
    required this.idnumber,
    required this.itemprice,
    required this.itemphoto,
    required this.itname,
  }) : super(key: key);

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int quantity = 0;
  Box<ItemModal>? finalbox;

  @override
  void initState() {
    super.initState();
    finalbox = Hive.box<ItemModal>(BoxName);
  }
  // final _shoppingBox = Hive.box(BoxName);
  // final int key = keys[index];
  // final data = _shoppingBox.keys.map((key) {
  //     final value = _shoppingBox.get(key);}

  @override
  Widget build(BuildContext context) {
    List<int> keys = finalbox!.keys.cast<int>().toList();
    return quantity == 0 //&& keys.isEmpty
        ? Container(
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
                  print(widget.itemprice);

                  setState(() {
                    quantity = quantity + 1;
                  });

                  ItemModal itemModal1 = ItemModal(
                      id: widget.idnumber,
                      qty: quantity,
                      price: widget.itemprice,
                      itemimage: widget.itemphoto,
                      itemname: widget.itname);

                  finalbox!.add(itemModal1);
                },
                child: const Text('+ ADD')),
          )
        : Container(
            height: 31,
            width: 120,
            child: Column(
              children: [
                Text(
                  'Added To Cart',
                  style: TextStyle(color: Color.fromARGB(255, 3, 170, 9)),
                ),
                Text('Successfully')
                // FloatingActionButton(
                //   onPressed: () {
                //     int index = finalbox!.length;
                //     setState(() {
                //       quantity -= 1;
                //     });
                //   },
                //   tooltip: 'Decrement',
                //   child: Icon(Icons.horizontal_rule),
                // ),
                // Text('$quantity'),
                // FloatingActionButton(
                //   onPressed: () {
                //     int index = finalbox!.length;
                //     setState(() {
                //       quantity += 1;
                //     });
                //   },
                //   tooltip: 'Increment',
                //   child: Icon(Icons.add),
                // )
              ],
            ));
  }
}

  // Widget firstwidget() {
  //   return Visibility(
  //     child: Container(
  //       height: 25,
  //       width: 80,
  //       child: ElevatedButton(
  //           style: ButtonStyle(
  //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //             RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(18.0),
  //             ),
  //           )),
  //           onPressed: () {
  //             ItemModal itemModal1 = ItemModal(
  //                 id: widget.idnumber,
  //                 qty: quantity,
  //                 price: widget.itemprice,
  //                 itemimage: widget.itemphoto,
  //                 itemname: widget.itname);

  //             finalbox!.add(itemModal1);
  //             print(widget.itemprice);

  //             setState(() {
  //               quantity = 1;
  //             });
  //           },
  //           child: const Text('+ ADD')),
  //     ),
  //   );
  // }

  // Widget secondwidget1() {
  //   return  Container(
  //       height: 25,
  //       width: 120,
  //       child: Row(
  //         children: [
  //           FloatingActionButton(
  //             onPressed: () {
  //               setState(() {
  //                 if (item != 0) {
  //                   item = item - 1;
  //                   quantity = item;
  //                 }
  //               });
  //               print(quantity);
  //             },
  //             tooltip: 'Decrement',
  //             child: Icon(Icons.horizontal_rule),
  //           ),
  //           Text('$quantity'),
  //           FloatingActionButton(
  //             onPressed: () {
  //               setState(() {
  //                 item = item + 1;
  //                 quantity = item;
  //               });

  //               print(quantity);
  //             },
  //             tooltip: 'Increment',
  //             child: Icon(Icons.add),
  //           )
            
  //         ],
  //       ),
  //     );
    
  // }
  
  // @override
  // Widget build(BuildContext context) {
  //   List<int> keys = todos!.keys.cast<int>().toList();
    
    
  //   return keys.? firstwidget() : secondwidget1();
    
 
  // }}