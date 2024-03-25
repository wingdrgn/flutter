import 'dart:core';

void main() {
  List<String> list = ['Leslie', 'Vivian', 'Jacky'];
  void printElemennt(element) {
    print(element);
  }

  list.forEach(printElemennt);

  //可选参数
  int add({int? i, int? j}) {
    if (i == null || j == null) {
      return 0;
    }
    return i + j;
  }

  print("--1--${add(i: 10, j: 20)}"); //30
  print("--2--${add()}"); //0
  print("--3--${add(j: 20)}"); //0
  print("--4--${add(j: 20, i: 10)}"); //30

  //默认参数
  int sum({int age1 = 1, int age2 = 2}) {
    if (age1 == null || age2 == null) {
      return 0;
    }
    return age1 + age2;
  }

  var user = User('Leslie', 18);
  print("${user.name}: ${user.age}");
  //命名构造函数
  var user1 = User.age(18);
  print("${user1.name}: ${user1.age}");
}

class User {
  //class 每个对象都是一个类的实例
  var name;
  var age;
  //默认构造函数
  User(this.name, this.age);
  //User(this.name);//error 不允许重载
  //命名构造函数
  User.age(this.age) {
    name = 'Vivian';
  }
}

//抽象类
abstract class Auser {
  void say();
}
class Person extends Auser {
  @override
  void say() {
    
  }
}
