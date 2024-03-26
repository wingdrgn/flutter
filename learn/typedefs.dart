typedef IntList = List<int>;
typedef ListMapper<X> = Map<X, List<X>>;

IntList i1 = [1, 2, 3];

int sort(int a, int b) => a - b;

void printInts(List<int> a) => print(a);

void main() {
  print(sort.runtimeType);

  const list = [];
  list.add(1);
  list.add('2');
  printInts(list);
}
