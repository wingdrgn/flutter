//重写方法时 使用类型安全返回值
//重写方法时，使用类型安全的参数
//不要将动态类型的list看成有类型

/**
 *           Meme
 *            |
 * Doge     Pepe     AiToken
 *           |
 *       PBB   AiPepe
 */

void main() {
  List<dynamic> token = <dynamic>[AiToken()];
}

class Meme {
  void buy(Meme a) {}
  Meme get parent => Meme();
}

class Pepe extends Meme {
  //子类型参数必须是父类方法参数相同或其父类型
  @override
  // void buy(AiPepe a) {}
  void buy(Object a) {}
  //返回值可以是父类的任何子类型，但不允许其他无关类型
  @override
  // Slerf get parent => Slerf();
  Wld get parent => Wld();
}

class AiPepe extends Pepe {}

class Slerf {}

class AiToken extends Meme {}

class Wld extends AiToken {}
