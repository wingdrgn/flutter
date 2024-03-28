//dart是面向对象的语言 函数也是对象 所以函数可以分配给变量或作为参数
//函数
bool isoboble(int? num) => null == num;

String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

//main函数有可选的List<string>参数
//dart fuction.dart 1 test
void main(List<String> arguments) {
  print(arguments);
  print(isoboble(1));
  print('${say('Bob', 'Howdy')}');
  const list = ['apples', 'bananas', 'oranges'];
  list.map((item) {
    return item.toUpperCase();
  }).forEach((item) {
    print('$item: ${item.length}');
  });
  //生成器函数 延迟生成值序列
  //同步 sync* 返回Iterable 
  //异步 async* 返回Stream
  Iterable<int> naturalsTo(int n) sync* {
    int k = 0;
    while (k < n) yield k++;
  }

  for (int i in naturalsTo(5)) {
    print(i);
  }
}
