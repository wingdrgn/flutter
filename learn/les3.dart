import 'dart:html';
//内置库 dart：
import 'package:test/test.dart';
//其他库

import 'package:lib2/lib2.dart' as lib2;
//指定库前缀

//仅导入一部分
// Import only foo.
import 'package:lib1/lib1.dart' show foo;
import 'package:lib2/lib2.dart' hide foo;

//延迟导入 deferred as，要async
import 'package:greetings/hello.dart' deferred as hello;
