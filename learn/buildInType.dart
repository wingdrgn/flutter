import 'package:characters/characters.dart';
//1.数字有两种类型 int double
// var x = 1; //int
int x = 1;
double y = 1.1;
//还可以声明为num 可以同时拥有int和double
num z = 2.1;

//2.string
String s = 'this is a string';

//3.bool true, false


void main() {
  print(z.runtimeType);

  //string - int
  num one = int.parse('1');
  assert(one == 1, 'num one');
  //string - double
  double onePointOne = double.parse('1.1');
  //int - string
  String sone = 1.toString();
  //double - string
  String sdouble = 3.1415.toStringAsFixed(2);

  //$表达式把值放入字符串
  print('the string is $s');
  //获取某个对象对应的字符串 ${}
  print('the string is ${s.toUpperCase()}');
  //多行字符串 用三引号
  String s1 = '''
  this is a string
  whit break line''';
  print(s1);
  //原始字符串 ➕r
  var s2 = r'In a raw string, not even \n gets special treatment.';
  print(s2);
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];
  print(
      '${aConstNum.runtimeType}, ${aConstBool.runtimeType}, ${aConstString.runtimeType}');
  const validConstString = '$aConstNum $aConstBool $aConstString';
  String invalidConstString = '$aNum $aBool $aString $aConstList';
  print(validConstString);
  print(invalidConstString);
  //读取单个uincode
  var hi = 'Hi 🇩🇰';
  print('The last character: ${hi.characters.last}');
}
