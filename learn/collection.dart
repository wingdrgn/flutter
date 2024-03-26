//1.list
List<num> list = [1, 2, 3, 4.1];
//创建编译时常量
var constantList = const [1, 2, 3];

//2.set
var halogens = {'Leslie', 'Vivian', 'Jacky'}; //Set<String>
//创建空set
Set<Object> names = {};
//var names = <Strinng>{};也可以
// var names = {}; map, not a set

//3.map
// var gifts = Map<String, String>();
Map<String, String> gifts = {};

//4.扩展运算符。。。

void main() {
  // constantList[0] = 0;//error
  // print(constantList);
  print(halogens.runtimeType);

  names.add('Andy');
  names.addAll(halogens);
  print(names);

  gifts['first'] = 'yxl';
  gifts['second'] = 'lu';
  print(gifts.length);
  //如果没有 返回null
  print(gifts['third']);

  //5. 控制流运算符
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  print(listOfStrings);
}
