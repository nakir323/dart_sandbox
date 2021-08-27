import 'package:riverpod/riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
}

final counterProvider = StateNotifierProvider<Counter, int>((_) => Counter());

void main() {
  final container = ProviderContainer();
  print(container.read(counterProvider)); // 0
  container.read(counterProvider.notifier).increment();
  print(container.read(counterProvider)); // 1
  // final test = container
  //     .readProviderElement(counterProvider)
  //     .watch<int>(counterProvider);
}
