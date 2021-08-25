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

  // listenを試す
  container.listen<StateController<String>>(
      stateProvider, (value) => print(value.state));
  container.read(stateProvider).state = 'Baz'; // Baz listenで登録したprintが起動する
}
