import 'package:riverpod/riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
}

void main() {
  final counter = Counter();
  counter.addListener((state) => print(state));
  counter.increment();
}
