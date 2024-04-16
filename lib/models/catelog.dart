import 'package:flutter/material.dart';

class CatelogModel {
  static List<String> itemNames = [
    'RuneStone',
    'Nobody',
    'Milady',
    'Heisenberg'
  ];

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  static const int price = 42;

  //:在这里的作用是分隔构造函数参数和初始化列表，用于执行额外的初始化操作。
  Item(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
