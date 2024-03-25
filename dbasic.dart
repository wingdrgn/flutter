import 'dart:core';

void main() {
  print('hello world');
  //一切变量皆对象 所有变量继承自object
  String name = 'hahah';
  print('$name');
  var age;
  age = '19';
  age = 19;

  print('$age');
  print(age.runtimeType);

  //final 赋值后不能改变 const

  //级连操作符
  List<String> list = [];
  print("${list
    ..add('leslie')
    ..add('vivian')}");

  /**
     * 内置类型
     * num: int, double
     * string,
     * bool,
     * list,
     * Map
     */
  num year = 2024; //int
  year = 2024.0; //double
  //在list 字面上之前添加const 关键字，可以定义一个不变的list对象
  var names = const ['leslie', 'vivian'];
  print(names.length);
  // names.add('jacky');//error
  //map
  var map = {'name1': 'Leslie', 'names2': 'Vivian', 'names3': 'Jacky'};
  print(map);
  var names2 = Map();
  names2['names1'] = 'Leslie';
  print(names2);

  map.forEach((key, value) {
    print('$key : $value');
  });
  for (var k in map.keys) {
    print('$k : ${map[k]}');
  }
}
