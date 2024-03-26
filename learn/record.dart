Record record = ('first', a: 2, b: true, 'last');
// (String, int)? record1;

(int, int) swap((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {
  (String, int)? record1 = ('a string', 123);
  print(record1);
  ({int a, bool b}) record2;
  record2 = (b: true, a: 123);
  print(record2);

  //记录字段
  var record3 = ('first', a: 2, b: true, 'last');
  //命名字段通过同名getter
  print(record3.$1); //2 last
  //位置字段通过position
  print(record3.a);

  (int x, int y, int z) point = (1, 2, 3); //(1,2,3)
  print(point);

  const json = <String, Object>{'name': 'Leslie', 'age': 18, 'color': 'blue'};
  (String name, int age) userInfo(Map<String, Object> json) {
    return (json['name'] as String, json['age'] as int);
  }

  var info = userInfo(json);
  print(info);
}
