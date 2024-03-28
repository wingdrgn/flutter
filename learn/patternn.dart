void main() {
  (num, Object) record = (1, 's');
  var (i, s) = record;
  print('$i, $s');

  String? may = null;
  String a(b) {
    return switch (b) { var s? => 's?', var s => 's', _ => '_' };
  }

  print('${a(may)}');
  //空断言
  (int?, int?) position = (2, 3);
  var (x, y!) = position;
  print('$x, $y');

  //record匹配 要拿相同的key
  var (myString: foo, myNumber: bar) = (myString: 'string', myNumber: 1);
  print('$foo, $bar');

}

