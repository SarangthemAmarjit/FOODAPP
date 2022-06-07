import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'ItemModal.g.dart';

@HiveType(typeId: 0)
class ItemModal {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int qty;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String itemimage;
  @HiveField(4)
  final String itemname;

  ItemModal(
      {required this.id,
      required this.qty,
      required this.price,
      required this.itemimage,
      required this.itemname});
}
