//为什么用泛型
//1.减少代码重复
//2.生成更好的代码

//限制参数类型
// extends

abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}

class SomeBaseClass {}

class Foo<T extends SomeBaseClass> {}

class Extender extends SomeBaseClass {}

var someBaseClassFoo = Foo<SomeBaseClass>();
var extenderFoo = Foo<Extender>();
