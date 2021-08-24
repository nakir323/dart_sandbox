import 'package:riverpod/riverpod.dart';

final stateProvider = StateProvider((_) => 'Foo');

void main() {
  final result = ProviderContainer().read(stateProvider);
  print(result); // Instance of 'StateController<String>'

  final value = ProviderContainer().read(stateProvider).state;
  print(value); // Foo

  // stateを書き換えてみるが、これだと書き換わらない
  ProviderContainer().read(stateProvider).state = 'Bar';
  print(ProviderContainer().read(stateProvider).state); // Foo

  // ProviderContainerを使いまわして書き換える
  final container = ProviderContainer();
  container.read(stateProvider).state = 'Bar';
  print(container.read(stateProvider).state); // Bar

  container.listen(stateProvider, (value) => print);
  container.read(stateProvider).state = 'Baz'; // 何も起きない。listenで登録したprintは起動しない。
}
